Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A452C33F59C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791783823; cv=none; b=X4sN1Mh9xBOLtqDM6Tw5yUTGytBewEURvj8iLRlPG72Js2OhM8tPs1wz47jfpJ3HB9HHK2BAmL4gqm8LPfJUYe2Zba9su51ZU52G/VHngmchuk/ln7yRrcHwAXy9bkv4ovHtvO9v94UDPeMviFMku+GjKPOv9E6CVzAgxj6KfCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791783823; c=relaxed/simple;
	bh=CEzhNpLUvOnUj0MajJKzF5fkj2haxm67cObJvM40yHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QmxiBY1mK0li4M7AKkzz0c4jTdxlj2N1zIPgYRKOpT29mwkuMzRDc4QDJC5+Q1QEhu4gqBNMwtQHIGAR9ilYEgD+3t3asv4JdkrQ43fZwmBmZm5AQomWBsG3mYD/ZvmVe14SKAAm24J9HDYa40oTD+NIhcd00aGnf5u4rRMiqxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fwtrO2UO; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fwtrO2UO"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ab066bef7dso650772a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783822; x=1792388622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzB0sfX1Eu2dpHCP/O13BODS55l2cg9tFlwbA80ij2Q=;
        b=KZe91p507nl6fF8hbX0PUNHKotWX6cPd0QJvqgA0cUB+452eyw9xtiPtFJtpKSZ0a6
         nwM8PJDkpN0iuxYaGXnv8/RpgYnB7SsqukkcigxVlb/ucnHx75czgYIvMr3BTbj6k6ZB
         6GmUvK7Y5csse3ehYWlPTpq5QRn5K3MPOrFgc3niS031bNMgG1LmOgzU84T0YILzJDMS
         i6mn2IBv3jvdjnsN7YXOHz+wVwp5DfGYS9JoBoGNDW8zPS1/8NTauOrgLvn33/Cp0nWU
         BUr9GQtqY6Ard3hzsCyCbJG2YANL+XbdHCb1fHWqx/qWmgO6KNffTwtRG+APSnHysc6D
         JDaA==
X-Forwarded-Encrypted: i=1; AKwUvByGkbZXK/o8O19+f/5kOPtgULm+JwaYOgscav4cX2yv7Ct5OwoMQ/KiSzKDP4P1kgnmiRdWGE5peHjSV34=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1+m8ctNNsxQzCeXHzlyVrRbsfE2CGZxv7la+gtYJi8UNg0gRo
	GeWPXniA92iLDs13NTD1eLGQXxbDy7epiGLZWotz/GAlv0YNFemymt4KyVemE37TB/I1QZJT8qD
	YFVK6o3KB6AI0x8GomeYvZIAvbJ9/pp6eSSYKtr0CraGC+9Cf07edse25Bdkn9OBOFi3JSr1Vfy
	dZI+otEDDiokwTPUFxLQog2KQZNvBsV6tSO+oQjudz++ts7OcEcoVopbStxt9FfK+fvfV0L2ooX
	6F8VW/n72R2Z7ZvWA==
X-Gm-Gg: AYBFou0XxSpLjvCkW0jUnU73uOE7oFVQdatAw+79+ivQXb6zckx+HlBwOaFKNVHTZmV
	AsXqgyCiVWEKCmfh6Oa/WZg367IvgkJlHw6UVbLJufOfx6OhMhbvtmMqkOB5CIy2Moi13x9ceaH
	Wh4r8VmDRiUxtpkkc4I2Wah8w1eTSXnXbzKvYIF9aTSbc3JN/sg3Xsivzqa4PFrph55zhVE2i4J
	ZagxSSqJ4gMusawGiSZHEA2Py0z21eYVmWSjUzMD5i8uod1k5xJNuoqnZsZ8Zj1zVH74hXs06qQ
	+/V8twE2/8umD3U1ix1cNPwalNK70f1Yq1VjqLJtNJ2pmQSF7hGa+j5ExGILHsuEGaPW41f/wQj
	SxauWQG53z8sYxt1In3y3qiSCqI0ELsgV75dYhRIMzklTgtaLRqY3r0pQOmiAj6Xt8f8pn6B9mR
	ZSx9tl+n6FxxQy6mkvCQ7t/ooAQTi6ndRhC25E
X-Received: by 2002:a17:90b:4a45:b0:3ab:2caf:c098 with SMTP id 98e67ed59e1d1-3ab3a32f5a5mr6711546a91.7.1791783821900;
        Sun, 11 Oct 2026 22:43:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ab37a4a652sm5226649a91.5.2026.10.11.22.43.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:43:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso1117601a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791783820; x=1792388620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzB0sfX1Eu2dpHCP/O13BODS55l2cg9tFlwbA80ij2Q=;
        b=fwtrO2UOuTyWeNQuCergDmzeCn/xOlGwP2VyuSxLSO1pEqkjbx77mkLT/+usoC/+O4
         ZaeDGe7SoVpKC6Ir5eoH/C8hu1u3WOihSikzo3KTj3ucXWSBZydsHDIcJlJ/Y1GTYN/B
         1NN6YNT8rxFWBstybtLlPhQd+f1NhV62wl1yc=
X-Forwarded-Encrypted: i=1; AKwUvBwj/hejcXl7ziueaVU4yx/vZfGdSk8b0wL+HQGbWuXPok0Ef8R5CxUSasp54YmT9POvR0gNrGnmAHQ4N/8=@vger.kernel.org
X-Received: by 2002:a17:90b:5444:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3ab3ab22794mr6797732a91.41.1791783820239;
        Sun, 11 Oct 2026 22:43:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5444:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3ab3ab22794mr6797719a91.41.1791783819785;
        Sun, 11 Oct 2026 22:43:39 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f8277bsm14615587a91.11.2026.10.11.22.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:43:39 -0700 (PDT)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net 1/2] bnge: fix RSS table sizing for large RX ring counts
Date: Mon, 12 Oct 2026 11:13:24 +0530
Message-ID: <20261012054325.1782819-2-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261012054325.1782819-1-vikas.gupta@broadcom.com>
References: <20261012054325.1782819-1-vikas.gupta@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Dharmender Garg <dharmender.garg@broadcom.com>

bnge_adjust_pow_two() adds one block before rounding up to a power of
two only when the quotient is 0 or 1. A larger quotient that is already
a power of two is returned unchanged, so 129-192 RX rings get a
128-entry RSS indirection table and 257-320 rings a 256-entry one. The
rings above the table size never receive default RSS traffic.
bnxt_calc_nr_ring_pages() always adds one, which is correct.

Always add one block before rounding up. The same helper sizes the ring
pages; their count only changes when the number of entries divided by
the entries per page is a power of two of 2 or more, which does not
happen with the default ring sizes.

Fixes: 627c67f038d2 ("bng_en: Add resource management support")
Signed-off-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge_resc.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
index b62a634669f6..c0b6992d7f82 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
@@ -81,13 +81,10 @@ bnge_adjust_pow_two(u32 total_ent, u16 ent_per_blk)
 {
 	u32 blks = total_ent / ent_per_blk;
 
-	if (blks == 0 || blks == 1)
-		return ++blks;
+	if (!blks)
+		return 1;
 
-	if (!is_power_of_2(blks))
-		blks = roundup_pow_of_two(blks);
-
-	return blks;
+	return roundup_pow_of_two(blks + 1);
 }
 
 #define BNGE_MAX_ROCE_MSIX		64
-- 
2.52.0

