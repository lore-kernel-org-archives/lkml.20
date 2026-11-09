Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200438;
	b=xApTusjFmuJtEdl+6wIQQQV5Lm9rwmKJMzrA/L1oLV2gk2wyo0J2/lKmTSC+HFX3FnyP
	 AdCoMv9cYi4sZknCcb4bqbI+60D2dcZdgXc5FCQO2aTg0tszyVjtSnYGvnoD3GMdhcIDN
	 MBkEoGe71WUrByIwK0/FnzcyLDGzFGIkXp6WycBpJtMz+TqQMZlp9zTH7SrwtpsI6OIZ+
	 Xuxdr+5k4257OocAyvDMujFpa7VE+1qobrV9b6Hj6/IeFcqt252blKmTGHa9EoyToI+gJ
	 aoSDot+2Fgw9zIVuw8J54qn+eAjf+y3sLWu1Civ/OZMuEsFUk1+1BOtuTD3SXt5+1kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=oESDww53zGSoGH4IO1bUrrqGEhAQT6H46eRyViPIMYQ=;
	b=gDceQLFE5rZGz26+YyUGtCTHqwJz4wF5e3J2joWWxgG0ecOWydy2RFi4+y+rPs2wLQJS
	 iubdl5Rk4iv+7d/g9ou+r7pq+OFimx0GsThzPbR8dJieqEFDcukQM2eafuKjv88/KZ/Cz
	 X5st3pjP9gQlUwYGdZWVd3uClZYT4730L7J69Bl926MKq/uPpqSkd+zkJoWh1hepPzW/6
	 OyUZc8eH6kMzytrHGWd8+Cfthy/L4dZHJM5SpJ/iMbdKp0Uxb9/wskLHVNeVvIkpa3br5
	 PjyL7GvnqxV2XQt7qHG221x2o+j4/Z6afl62Dbxao4R2y7qiEmoWhFn+JBZc+Hgyy/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwNoimSt;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD334606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD334606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwNoimSt
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-825b40f8a26so185971a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200436; x=1794805236; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oESDww53zGSoGH4IO1bUrrqGEhAQT6H46eRyViPIMYQ=;
        b=UwNoimStSSPQTdJ+XmanVE386Z3IgzT3eWxbLpFXXMkNjf/noTv8mxVn7eyG3MYHAz
         bNTT0kEnP6BvRx4sao4ayQdh7/I/3dMVoLK33SNaPiF5n049eeiw+jDEmWU/C/ixw0zf
         bN/1GckfHsze3jyUtV+I/NrY0qcwBqZ+xGorxjWeJfIMXS+mgJVJNPXjlo810Y8Ipaas
         FLalFKze3VMLEMvltQ91D2thIlkLoMhIG/+rUYOTpQL8/j2vE3BiupnSa0aNn+e8eEcL
         qv/1lpNVoICG5mAElMpPmO/eMKVyRzYLuZ5zXxUaKSbJIxrVO/MQhiiS/MaTAY/vD/s1
         S91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200436; x=1794805236;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oESDww53zGSoGH4IO1bUrrqGEhAQT6H46eRyViPIMYQ=;
        b=nC29jRWFVoaYTPT8M4+suXOSmJPqw+cdW8ny5SdBZO7cmSLAtVr4LujOIKnj8SIf/U
         Tnmm9sUPmrSIbLg1q4kNnJLq6jd1/aFcCkjulcT5oW/UAJE+u1++T2BInBB2soek4jsq
         /ZFNGmclVZOVJQUSE+jF4TIR/L4OI3xx9HrnBdNl/xI0aCeEeTXMyUhwaHOLc5pEKOyi
         kKTQBaK9nN2ZIajK8wAKokiJ+EqEYGoouwGU7xpeXue3kODJeqaMjT4pHiZSMASfNfk9
         0TTEQ1Sy5N2pRLYVIBYHuqq1pCVkeLBHubwrOTV10+YhLCYDQXr1j/m4j3SeXpBwmfoW
         d2YA==
X-Forwarded-Encrypted: i=1; AL+hErENqnsTRwSg4nTDIfOjT9UJNEquOKFvW9DIQSpJjC9qgkWi6lzBM54FXEuDozVJEMDa33RmhkzaeAp6XE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rnUWYf2RjKIwsE/tgCM7d1pXixIBKcjj6d77JRzdlEEuFv4ve
	BB/BLLAkJk87dgoMyX1fHL7Qn/uIOkf2L0vxgpgr+KuJaatinBHUZ8pa
X-Gm-Gg: AYBFou06WzCD8s6rLayjAqp/QbdrIaLmHguzLSwlYZK4AvK4KFSPuIKytlq9KUYjCcu
	uSa2aWKCKlwi25m+YNi01DpyzABM63QTYh5SIQZ1IlA4GMK8ytMuku7KvLhsdcvqgwenFCnPuGv
	ECQcF4bpGHdpRebC0CZUJ6udLWsmNQSQzyro4815m+fHRKuRmx8PaDpGUOKug3BG0bBghm4K0U5
	Ulg3wrkHzgUxf8r0uSQ5Edn7IlFCeCGzjgVNO6c6ClNt+gHOYFziWwX8T2Af7ew0IgwKYVcdwfn
	Tj2XF/Sk4zEiL847X+fkB87hGIuJwDliCfVU4+rrlrYtLt64nOVed8W3+1V1i61In3mMRDn/j7b
	Khg9WZMYbpyFMnWwFvzfanhXDoIcbb0jv5dMDz6wTLhRXTSzduPJmeDEcUwpYx2qdQlGAKqn+oF
	AI9a8bLt1HlYcZUK8B0WYiqKnxgp8/zCoyIOGe66HS+UfR2AbpORTuqbnbYnL6fNUd331g8EUYp
	rvuGxdjrDp/pLZC+w7ITb48eRY3j3AvM79GbhUHSiq36d/q/5OVmIBcdHTIsPMu10JQp1LkwZn6
	4dP9PUQWLQLxnq+Iu5QlNSnbvmQD3o/BcN1bHVnFhd2/xj9P9F1yUQofRNUwk0z6qedqTnbo1Cu
	/tmUvkD2UJcKNDK74ZOEnQNxArCcq1E4cxJC+gd8LhJcYuR6/a2cIe8wAVj7NDihJv+p7c8eF22
	MY4kq+KKf5zA8hXTvmNj229eiyMEzPWOkaRDKh1V612i8cC65cnUM=
X-Received: by 2002:a05:6830:b13:b0:81c:dbd7:65dc with SMTP id 46e09a7af769-85f50783fccmr2360049a34.7.1794200436306;
        Sun, 08 Nov 2026 21:00:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fb2be33sm2953090a34.13.2026.11.08.21.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:00:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 22:00:32 -0700
Subject: [PATCH] dmaengine: tegra: only advertise supported pause
 operations
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-submit-tegra186-dma-pause-caps-v1-v1-1-9cc9b17a033d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQ7CIBBEf6Xh7EZAJY2/YjwssNI1KRKgjUnTf
 xfs8U1m3myiUGYq4j5sItPKhT+xgToNwk0YAwH7xkJLbZSSI5TFzlyhUsioRgN+Rki4FAKHqcC
 qwJirVxct/U1q0Twp04u//4/H8+AmeZOrXdwbFtvcZoxu6lFTUgwc6Xzs9v0Hy5/Ip6cAAAA=
X-Change-ID: 20261108-submit-tegra186-dma-pause-caps-v1-664d1320d502
To: Laxman Dewangan <ldewangan@nvidia.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Pavan Kunapuli <pkunapuli@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: Rajesh Gumasta <rgumasta@nvidia.com>, 
 Thierry Reding <treding@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>, 
 dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Tegra186 does not support pausing a channel, but the driver installs
device_pause and device_resume for every variant. Both callbacks return
-ENOSYS on Tegra186.

dma_get_slave_caps() derives cmd_pause and cmd_resume from the presence
of these callbacks. Clients such as generic 8250 therefore accept RX DMA
channels that cannot satisfy their pause requirement. A receive timeout
then reaches an unsupported pause operation instead of being excluded
when the channel capabilities are checked.

Only install the pause and resume callbacks when the matched chip data
advertises hardware support. Keep them available on Tegra194 and later.

Fixes: ee17028009d4 ("dmaengine: tegra: Add tegra gpcdma driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/tegra186-gpc-dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index e76c58f213d8..72266f490e8a 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -1518,8 +1518,10 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	tdma->dma_dev.device_terminate_all = tegra_dma_terminate_all;
 	tdma->dma_dev.device_tx_status = tegra_dma_tx_status;
 	tdma->dma_dev.device_issue_pending = tegra_dma_issue_pending;
-	tdma->dma_dev.device_pause = tegra_dma_device_pause;
-	tdma->dma_dev.device_resume = tegra_dma_device_resume;
+	if (cdata->hw_support_pause) {
+		tdma->dma_dev.device_pause = tegra_dma_device_pause;
+		tdma->dma_dev.device_resume = tegra_dma_device_resume;
+	}
 	tdma->dma_dev.device_synchronize = tegra_dma_chan_synchronize;
 	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-submit-tegra186-dma-pause-caps-v1-664d1320d502

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

