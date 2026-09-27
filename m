Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B7E3CB569
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546049; cv=none; b=jBVAnQUn+ykW1JIIarGBvfgxsPb9iRSG8r/71UOo3jcILeAxugmB/9vJl0exsDb3qSwzKaRpC61RIKiIiXVAtj5Sa+F2WrMAkwS1x1Dux3nnI9JGYv3csnUrkZExVAgf22aMqwL5CWl9GVrad2muVo26jr2UgLD3yeXTIviratY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546049; c=relaxed/simple;
	bh=s1Qf6zVi8UhwTlovQ06Go/fkv9HRKtX4+5qnTRUsQ7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YP4FpP322rYroIb69w9mD6ajphVtf+EQlk2Qfvag1MHt49AmS9hmPTKxhe2ogOaJ86/UwmS4ECROmc3cs57DTTnWbgmBepSQQyvUR6pKded0S0KAbseThkIj0r3EDjDFOPh72WAeRvUfDZzzfjIr7MV9dqx91VehMsmBRzCbY9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZB9v5GH6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZB9v5GH6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so5748095e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546043; x=1791150843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8iktBbgnmQg52LPBJr5bT0zIG6cybwQ3bD7gV4BQmY=;
        b=ZB9v5GH6DwoWGP+y4sCieDvJkpLxpvB1sSxndPFJUu5rac2FHkgrEEpnGM5y5zZ8G/
         7uuj2e6/pEFvN7Mj544BeEDTM1BrBbWWjtTFrrO3olhsPAx71V60bY2tDCU5Lhbrwxgj
         +WAv01bZw8dL4/QxdY4Cpcyd3e+TwURekPRNuyeIo7NA8U7fYi+4xOUWVZV7O2aUJ36p
         IOloQYtF/NZzsoFg5kJ+X+BePxMqd2DO3JAspN05CnZKZpsOH2N0pN+yOc9trF75xbzD
         OooaDzv1L4UlozOC/4xqitfB8wUa2+15/J/duIAIcghBhMqWX05KBxTcMFnEzxymlMW0
         h+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546043; x=1791150843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p8iktBbgnmQg52LPBJr5bT0zIG6cybwQ3bD7gV4BQmY=;
        b=YT9aoyC/VnNH9K5HqU/2iPIM2Lga5RbmtS5kPkw9dA/jxvI3fkOhw8yoJ7UalyzoAE
         ufjS2zYX6qxHoGtOfkYS3l4paHYKy2saGftknfgUJrjaLLsiPKVDaDZwu99mbCoNy3QD
         PMYeZlZYTGxbckXBr/8web/2CXC1Uo+liAGTag2BK7Gp2CdDH4Bp/GOkPo6wkzLStvOX
         atjECogYKEhve5GLrpzSlE59GmqN1kRIrXsXfrHoDx3/8/ZfhAYgjhGqCZ3uKDGa95YS
         /Y3Rs15FWBGgHBxPnXWN05rbghfSZAaMmf8WShk+wf4h9c1VB+y/uqZryHCW5JiJPqjx
         qoVA==
X-Forwarded-Encrypted: i=1; AKwUvBw6xiKnplPW9KgB1JxK/U7u3LJYQqOy1Hx5iW90+mvCwtEPp2wpZMe97J2397HES+2TZJe+BRpoSNlYJt0=@vger.kernel.org
X-Gm-Message-State: AFuF++kA7o54IkhlxJPxCqOkWjm0J85uqOFtckag8/JVlSXLehxEIK6d
	WQ3Bvdb83EyVSLLdKL/Z17N1vsJRGYdjjb72ZdrQ0HCC7B2VsXEILejU
X-Gm-Gg: AYBFou12HFRkE3q5oX9Jh6/suMdB+YGIhYwN6aERwpnEpevDowFZDMSr0eahBcoUGa8
	mmQisfqZrmzHaRhsPVMiCHDVcpSsqq54yi1lVfh7C/LNuRzzLfl2EiYxyV9Y8pprjITzbods4En
	4mthi0OlC0g8ZLWy6VNOcFzLIoFoqz1WHJpAFc99DUUUDwe6KObBHbkp7+NoxVBgWEwJ0WuCFdF
	Z+OIln7bAnnYuGiA19xLl9KSbleAkZCg8u38jeFzeY/xbP0MSjzp/UwkFX37qK/VLzqrb4hTydi
	eDRKMlG66ZAScXV2H/Uu7ssMyWj5oSp3si2qYJD8n2Zut2V2L4qtFHYuJ6F479mGjh/WQGTIZuZ
	rICWg8s3WOwhn/YlWbNI4shgUzNvr8PDnF5CDWaE0Unei6yIxlUx1XaWiNnpU+w7q4GPNSsGhBA
	Kt3rxIH+uJ935t6q5W+rbSjO2+LV/IJNpT/fXHd8WV4XDDQLtI0huuJwc4w8jCDqPlP4TuQXQH7
	Q==
X-Received: by 2002:a05:600c:8b2f:b0:49f:ff09:3b26 with SMTP id 5b1f17b1804b1-49fff093cfdmr58137705e9.6.1790546043380;
        Sun, 27 Sep 2026 14:54:03 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm89556865e9.15.2026.09.27.14.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:54:02 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v3 4/6] vxlan: vnifilter: clamp the dumped VNI range to the request limit
Date: Mon, 28 Sep 2026 00:52:07 +0300
Message-ID: <20260927215209.2581830-5-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927215209.2581830-1-alishmery18@gmail.com>
References: <20260927215209.2581830-1-alishmery18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vxlan_vnifilter_dump_dev() coalesces a contiguous run of VNIs sharing a
remote into one VXLAN_VNIFILTER_ENTRY with no upper bound on the span. A
device may hold the whole 24-bit space, populated by several requests,
and dump it as a single entry START..END. Now that a single request is
bounded to VXLAN_VNI_FILTER_MSG_MAX VNIs, replaying such an entry in one
RTM_NEWTUNNEL is rejected: the kernel emits an entry it will not read
back, so a dump/replay of a device's VNI configuration fails.

Clamp a merged run to VXLAN_VNI_FILTER_MSG_MAX VNIs so every entry the
dump produces is one the input path accepts. The run is broken in the
merge condition, by ending it once it reaches the limit even when the
next VNI is contiguous and shares the remote; the two representations
then agree on the same bound.

Resume across netlink message boundaries is unchanged. cb->args[1]
counts the VNI nodes already dumped and is advanced only when a
completed entry is written; a run is still a gapless block, so its node
count equals vnirange() + 1 as before, and the clamp only moves where a
run ends. A device with more contiguous VNIs than fit in one skb still
resumes correctly, now split into limit-sized entries rather than one.

Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---

Notes:
    v3: new patch. Clamp the dumped run to the request limit so its output replays.

 drivers/net/vxlan/vxlan_vnifilter.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 13f4e115701a..92ea1fc94f45 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -382,6 +382,7 @@ static int vxlan_vnifilter_dump_dev(const struct net_device *dev,
 			continue;
 		}
 		if (!dump_stats && vnirange(vend, v) == 1 &&
+		    vnirange(vbegin, v) < VXLAN_VNI_FILTER_MSG_MAX &&
 		    vxlan_addr_equal(&v->remote_ip, &vend->remote_ip)) {
 			goto update_end;
 		} else {
-- 
2.53.0

