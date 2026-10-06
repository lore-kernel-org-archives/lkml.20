Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C796A49F130
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303836; cv=none; b=NCzW/iwuvvdTVtUshSYpdvkEIft53aHR5xuM/4PtmRAzg+XCsX0gikqtkMwKvBFt9IwNYw3SqN3DIgccj7KyMUVe9wMRtXlj3qfY/ZUqrcLi2oIcIVtZNUceu+5ozRZ2TzsRlcbfFWcw8W8zFqHJ5lK6BCNkh4PiBcMUVQQOt5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303836; c=relaxed/simple;
	bh=VxMNyDoWxVlJ7T0GoD5YGGuBg3vpoeSHQkr1MLBpXfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYqAOm0QYddiiCa//DjS8EHvCf9OmMu4Yzrdx6dUFvo0RB7vxZIc1P2o39zrHl39V7N8n9rxJZYPidOKtwtZo5KtKR5igrAiB6fa7d77L8iq43utha/AT9d4XNq+eCZP6FEQhKCwI2V7nyJyBd974m5WnPbbhxYUXq2eGr1occ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cm6wAsod; arc=none smtp.client-ip=209.85.222.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cm6wAsod"
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-93e7ad9f78dso83262985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791303832; x=1791908632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fd78CaQGDmDD1ZFQcb9JSvynsD0IJAgYRm2QVzW7Ldg=;
        b=pDK7fZnZwZO1i5ZEIIIkQO+lsWPFNTjEBa+qew6By0USssH06aN1oxduQcR04BJpng
         nIHWBOn3sHHZK+X9Zu0YCFF1Zf/JykQNH27zaC/Vez57HU+guoADckJzDzlUP9hYnuxf
         m4dUNKwzXDVCuG4SFgFzcqxjT8IV11vNKGtm1Vqvh9Pg/JvUXrmb7RWMF2/iIypuY2sr
         i6EipD4YczGXiSunJhu/bogw1pmMdZGEuG+ibckS9ck8R7gm8UR3CLob2tJNkqGaO9Gf
         pyFHmETyecu3LWaNyg2xO/qQ2IACExiFz+M9sl7b5zfTsyniS9RizFuzEy4UEcCpcEjO
         Wc1g==
X-Forwarded-Encrypted: i=1; AKwUvBz1lxXFtfugOMDe10Xush5rhV6CvNMeotn4/6zqvxyK2+JmH7OzlvFe8AApr39hEMzQy9mKLdnK2OcnOlE=@vger.kernel.org
X-Gm-Message-State: AFuF++mbmR0FAK0JSKGeeYMJGFBi3uXHlyR/x99ATQvMZgka7i1oQ5Qj
	lVCHgJ5Ri+z2nEiADkYEImFx9TOKi5Vubz1e2iidWqXxAnxrJrgI0ILp1M0yo1x6GDbh9WmBd/z
	UgaPQ0G2I01eulQ0IFAyhg3zkSY2w4qe+bW0gK/44SIdI2rXxu29rFhWmGg/utgKgkDWWl67Ut/
	Keq8N+QTAEVM6DrXiToEmAqkhbk02aw2NK5bPFiM7CIYtKVtn5ZjgHMrK40nMQ1sd75NCIjfYjk
	KpXFQhV+7XxG/XNjg==
X-Gm-Gg: AYBFou1+JTtVVRMjpIIjE7WdzHyQlNB981gsyFmeI20vRfhCnOcQEqSNbpwnGNmfVqw
	aCVVTnJ+rCNlExtMaevFZtQoLBlp/sL/wKD+pFLdyp1TPWMFlzUrLnweRkzBKnYkfLSIrEuZxCW
	70w58x86nKGOkLax8bZM5az8tt/Wyf5b8Zpqoz8MgkHeXs+LicStNmWVjinLLuwddcxMdkG0THy
	cUxGqp+MSoY9MyROoruJX8UeVu3P+diRXgbKoUVGx6jf22U3wHKsqT4uexyTV3Gg9KTSFf203jB
	t9HTIfaYLYSO/WxBe/cNFFhWmLaTESGIlAnSiG0yEtiYfXuht7G/v2Fl9WJ5YHpNhVtJtalZXNi
	OXG1POeWgWFBHozR5nO0NIjTFKqsdUEun+UMlJMR5Ju1FpfQI0RWXB3qtrghByIem1hefo++hGa
	Qb2KA4BlgiP7n9+1eP7BI6emMVtTcBuUgCJSoy
X-Received: by 2002:a05:620a:471f:b0:93c:720c:94e0 with SMTP id af79cd13be357-93e8f377667mr368259585a.30.1791303831827;
        Tue, 06 Oct 2026 09:23:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93cca30e892sm513711485a.9.2026.10.06.09.23.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2026 09:23:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337f26ee19so84932351cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791303831; x=1791908631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fd78CaQGDmDD1ZFQcb9JSvynsD0IJAgYRm2QVzW7Ldg=;
        b=cm6wAsod7QzwpvP+UScMzoULxd9+GPD36ZF45anzBL37elGK3nyZS9QYL0dF4D7mqg
         jGkFVv0uO+9iyVsv+HcCxNKBjH1aszrFZmza3Yjo7jRWHisSjhrrLRhJmZlhqBKdDXJ1
         UUEO0AuVQAqX87xn/X1olFL70TBZQ3l22kliQ=
X-Forwarded-Encrypted: i=1; AKwUvBzRPPQnnu/SGuxrlsHZlLCyFx4f/bpslrsUu95MRKLDHmuPfX8Sa6JL1RQjN/2id66HHZ1OvkEXOImPo0g=@vger.kernel.org
X-Received: by 2002:a05:622a:64a:b0:532:18a0:491a with SMTP id d75a77b69052e-535671b6c03mr33111031cf.60.1791303830296;
        Tue, 06 Oct 2026 09:23:50 -0700 (PDT)
X-Received: by 2002:a05:622a:64a:b0:532:18a0:491a with SMTP id d75a77b69052e-535671b6c03mr33110691cf.60.1791303829742;
        Tue, 06 Oct 2026 09:23:49 -0700 (PDT)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5356b860df8sm9020961cf.14.2026.10.06.09.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:23:48 -0700 (PDT)
From: Siva Reddy Kallam <siva.kallam@broadcom.com>
To: leonro@nvidia.com,
	jgg@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: vikas.gupta@broadcom.com,
	ajit.khaparde@broadcom.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Saswati Das <saswati.das@broadcom.com>,
	Siva Reddy Kallam <siva.kallam@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>
Subject: [net-next v2 1/3] bnge: Add infrastructure support for RoCE MPC channels
Date: Tue,  6 Oct 2026 09:12:54 -0700
Message-ID: <20261006161256.1493672-2-siva.kallam@broadcom.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261006161256.1493672-1-siva.kallam@broadcom.com>
References: <20261006161256.1493672-1-siva.kallam@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Saswati Das <saswati.das@broadcom.com>

Add the initial L2 driver plumbing for RoCE MPC (PRIMATE channel)
support:

- Plumb BAR1 through to the RoCE auxiliary device info, alongside the
  existing BAR0, so the RoCE driver can reach the doorbell BAR.

This will be used by follow-on patches to issue RoCE commands over the
MPC channels to the firmware.

Signed-off-by: Saswati Das <saswati.das@broadcom.com>
Signed-off-by: Siva Reddy Kallam <siva.kallam@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge_auxr.c | 1 +
 drivers/net/ethernet/broadcom/bnge/bnge_auxr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
index 0955b488b6fe..87ae40eab592 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
@@ -181,6 +181,7 @@ static void bnge_set_auxr_dev_info(struct bnge_auxr_dev *auxr_dev,
 	auxr_dev->pf_port_id = bd->pf.port_id;
 	auxr_dev->en_state = bd->state;
 	auxr_dev->bar0 = bd->bar0;
+	auxr_dev->bar1 = bd->bar1;
 }
 
 void bnge_rdma_aux_device_add(struct bnge_dev *bd)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.h b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.h
index 6c5c15ef2b0a..13cb9289f5b8 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.h
@@ -46,6 +46,7 @@ struct bnge_auxr_dev {
 	struct net_device	*net;
 	struct pci_dev		*pdev;
 	void __iomem		*bar0;
+	void __iomem		*bar1;
 
 	struct bnge_msix_info	msix_info[BNGE_MAX_ROCE_MSIX];
 
-- 
2.43.5

