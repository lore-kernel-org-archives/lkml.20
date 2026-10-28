Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201678;
	b=w4p9gJN/uwbCbwasxBSd6UhqR7HEx9QcmS/no2g4n3n5eJRAIZu1EP3H5S4GRt+0LjIE
	 uw+PlUJVJGnlsoH5ZoSqasf/YIR6SKWQKWN3p/gtLYBhVgcc0Wp3KjrpsIqKl6SMcQ5WA
	 xEb2gP1E57tbEE4Otcbye6AkQ5jUC9CoFV3CB16wSkHJN2H+Hm07VwV9HDZK8AVBBtGSX
	 Tmi3ufy91YMLJiX/Er/y2PPww2ThrV7/jmuPj2g47jBpCetjo13FsY7nXrgyxmGrahvKc
	 DDSv25O5B51kfzYUF8O9VXtTp7XE7BjpiMRar7aDNn65uu4YI2y4XpqUI7bpNT76fMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nwQvp5gT0x4Cpwf86+olDk4WVML2oNByPo4ORkg5KCw=;
	b=G3KGfKyHLENPadLUHB2FNX80Q7U2QkuIQf0T+yb3YfFU/t2nOZ3VXVP/bnz/CfqsvjeC
	 8LtXvdocx4cWypHVS9kT/Bamladzoph1fNx7Tw60saxKhAcnffmHNBDN8Hf2c5JKQG2Gh
	 4YARyn8WRw9q0MORI/ef2isZzPTjxhUrM10ke2YRgwoeHVTMQRKiKdWTSx0SXdSPTKEFv
	 p4xNu5WqC/1ekEd6FiRGRxIcxZ3YoazyRJzV9oAI65JkCjwi7kHD/+thv/2Yeiu297bba
	 E/AZAG1t8JpCzPgSKn/9KKZ6BegX3EefkjPJtEyel0px2EYli087MZN6L/Zif7BXL1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQMZ4hD4;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9E5606A333
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC9E5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQMZ4hD4
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1f80b7bf6so1118025e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201676; x=1793806476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwQvp5gT0x4Cpwf86+olDk4WVML2oNByPo4ORkg5KCw=;
        b=CQMZ4hD4sVB4t0bzFakBLUKjDTrGYS3mdtMI0Mk9SqITBCUJ/Q5kUsVwo/cjdYl4r2
         Gj0jSmbHV0IcRDbeLEBRdiwmYy/TNMa2GgVWaNLuOEQu7p/KcrRi+NDnoxlrCtoGmnCf
         iB7fUXehopDG3JisGR1WTJio6CfokUl6bMkicidOn2udHddVNf/YNyxFbsOgoEhgCG3l
         SKFemmXOBmpAZzo/oXCybTSVoMI3mlXcweJM8J6iZZ3F1gg69y+WRkI3JkMB2k5uslJo
         Q6cCnuME7SfxFb98pVAlp80QGk9J/k7wKCW3HE3uPvCRav3rOG0jEQuGee/+B6/Vshjy
         szdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201676; x=1793806476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwQvp5gT0x4Cpwf86+olDk4WVML2oNByPo4ORkg5KCw=;
        b=UjQ5gzKGzCZuXsbUCakpoqh0RyE1HgL3nhy7n5ykLMpn5zreKgygNcfF2KwtvaEHKD
         w+L5bAbIgs+dmA+DqDJTZUBdbgatO4yf6n0V/fGixD98d0m+AdTd0gxRmbIcrFQKI56P
         E1O66EsWgR7Q4Y2hwEmktsj5BKSJQIOY+9Vf2qa7tmbRyJj+cxLl0hXNpPOSugg5nR4Q
         oicdaGItKPqS/3ilCj7r4j2/bGqbIFt5AnBOXGU5+OnYtTNwNPMDStkonTuwtGCuxBX+
         9WPWq/HUilVCsONkJmtrku6JEKmzpKFRr9c1wnPe8S1zsTpzyLMU3oaS/N24XbD+jO53
         95Qg==
X-Forwarded-Encrypted: i=1; AKwUvByjk8a+XIlBBixIZ+f/RvqjzQ7vEdCcCmTM1SHQxe7LT/1o+vKFdmFsOxGhZO3hKA0O8pLE+6m5H+wzRm0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKgLqYejPh3xxxS+JTssvR3ZZSa1/RBeFRKOio3IAy+cKUAfl2
	o7bMZ4hOOGUN39erypIKZM6wcPwU7cTJ+HrYN2xh4ME2CtN3ltx0fdx9
X-Gm-Gg: AYBFou3XutRQqXHZAbGgSj99innt22pKui+en+621lycjjbh9LJ85tSpp2jJjWEzYsX
	hKgQso7duAtz58QncpeDd36sla73HSabINsQGYenTfBFpLqLbgtvVrB7f7YNGPp0dzQRnTz3wmr
	yx2msu0rT12zKjS7e8n6C+oEtGnhBF7SYrNQT0aCkFbTMlbbZL4ke5iUn/3BYh3ISRwslM7gJas
	X23ZjQJD1BsWyiEwQxjDrLrtqkWuLmYE0lllqRvSPc5A9dyhxFvAg2hs8deHunFg4QacWrKqkZT
	3gLwrKB5jiZmPkONfFpKp5TZISh6/a3cBv6KRllsxqrT3kOdD5N6Gq331lk7gjxbMW/SifkMHJS
	rZn7W0D/VGbglorUDMYWCxU5i2VBuzGWzrJmJnNalQ0K41G5VOR3EuY1xzpaKwmC7sk5OjlTeXQ
	4B1GAoz08YH8DYz77HMxxXgylHMu3q+0uprx2+os9bWGaDHXm+ZfPsfTpVxn6vAzxX7iw48qVQA
	cp36zx8E0NFb9Ue/hzydGDV14UKTW4Cv6ZyctN7vqIUowXGkHyvIdpcHyQ/LWlqfGThH2zBYXg8
	gh4uRTqhgbtpdvQvj3JQAQk5HPEAZ05mrfq9zbb2rOO2Qt+mx+/rRAXQ2GdgNkO/SV+IE9AxGX4
	1otLQk0bV5Nc0d5P5aUYvxWQ=
X-Received: by 2002:a05:6000:2ad4:b0:48e:60aa:793e with SMTP id ffacd0b85a97d-48e60aa7a9emr3918828f8f.3.1793201675959;
        Wed, 28 Oct 2026 08:34:35 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm14428423f8f.13.2026.10.28.08.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:34:35 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Akash Asthana <akashast@codeaurora.org>,
	Roja Rani Yarubandi <rojay@codeaurora.org>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org (open list:QUALCOMM I2C QCOM GENI DRIVER),
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM I2C QCOM GENI DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	dri-devel@lists.freedesktop.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH] i2c: qcom-geni: fix double free of the DMA bounce buffer
Date: Wed, 28 Oct 2026 16:33:52 +0100
Message-ID: <20261028153353.69651-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

geni_i2c_{rx,tx}_msg_cleanup() release gi2c->dma_buf through
i2c_put_dma_safe_msg_buf(), which kfree()s the bounce buffer when the
message buffer is not DMA safe, but leave the pointer set. gi2c->dma_buf
is only updated when the DMA setup in geni_i2c_{rx,tx}_one_msg()
succeeds. If the setup fails for a later message, the function clears
only its local copy, so the cleanup helper sees the stale pointer from
the previous transfer, unmaps it again and frees it a second time.

Clear gi2c->dma_buf once it has been released.

This bug was found statically and compile-tested only.

Fixes: 357ee8841d0b ("i2c: qcom-geni: Store DMA mapping data in geni_i2c_dev struct")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a431e98723ef..78701310936b 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -500,6 +500,7 @@ static void geni_i2c_rx_msg_cleanup(struct geni_i2c_dev *gi2c,
 			geni_i2c_rx_fsm_rst(gi2c);
 		geni_se_rx_dma_unprep(&gi2c->se, gi2c->dma_addr, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
+		gi2c->dma_buf = NULL;
 	}
 }
 
@@ -512,6 +513,7 @@ static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c,
 			geni_i2c_tx_fsm_rst(gi2c);
 		geni_se_tx_dma_unprep(&gi2c->se, gi2c->dma_addr, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
+		gi2c->dma_buf = NULL;
 	}
 }
 
-- 
2.53.0

