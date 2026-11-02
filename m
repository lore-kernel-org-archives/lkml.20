Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622202;
	b=gEp9qOKqQ9Vtavl8HayLzAigYgRj9kSNKl3Gr/+5Q//U8NysjLifviE/akuzA7cEXamD
	 jugz1qrf+EP0VT55lY2G4tywxA4+oVqzYCdjpGQxixwyAUHkF58psmfvtDxWbkU4xcT+E
	 +AJtmbz45Lhfk72BsSNsQHF+MlzFNFZUzqueYW4m07nSVlus68ahDfFfC75A1NRw6MjXl
	 7JZJdI/k7aKHPefsyuVvHzU59Nd3aa4xVJ0R6AC0BvXP+DN5vthqsB8NlR76ese/VMOjP
	 TyFKuyFfqOO5vx8K+KbZ8owPWcvlOqmPDwTW+NKYWjsiZOFePJ5TXazFt4zDatKt5dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GO0eQoXsdHBDsAY8r5qLcEfQWImjpXMenyB3OyA2xhU=;
	b=ifptBCIAwLhVszo9vQFrTbLZS41Ku3IdJCtsH9yXr80offj0XLTmfI7e+u+3odR34cQS
	 027VVjIjkPTFSsL+KTnCjI53wsEiyXV+YrIPLAuyPOr/Ey0lQyUR9Ua3dbgjM6zCq5tPG
	 QsyYVKn20g3ZyLcLFbxw5L+w8NUb60ol5ockkndkJ7kWniANbTCdbTbe3yDbShxeL/LKL
	 EPlMRh6Be6TkjIf2BFWPcrjNzp6qPwu7aMeKoFJh/wF5gD4CTvuxx33fpPPn+1NJNHAeU
	 hB4r18csEDJu3ggAuZl/byuE/ykbVac8R5P9ZtwRZA2SHIKlP92QLF1bA8Ff71d0wEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oeIIAX4p;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B98260A6F47
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B98260A6F47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oeIIAX4p
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so12422495e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622200; x=1794227000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GO0eQoXsdHBDsAY8r5qLcEfQWImjpXMenyB3OyA2xhU=;
        b=oeIIAX4pm2Ytu8HtJCliysszXx2L+ft1QWG6iYQQAJNhrx9G4v6CElDYaCW92uxUgQ
         PbcDRqjrGRfgtFHy03UVVHpCY4ePzARb20txTsium7zzi9mAPT/4uPGtFJGEbr7q4TWs
         Nj52mspXoZ80PZVZyWvoqFbT6bPBBGoJgHHhI/HPY2mnO2Ueqyf9YqQMitNYWXaAso4y
         7X72JBKP2aqjgJ2foNDEdhTgFLRx6hUS1sOCDrzayACksxscB+qleHmjUkfkcY1YogoQ
         YbKLFJfnRcBnUa9f/oZjQNwWoIGtLKrna9SAz6t39+meWa/qfXAgOGPakFgSVqVw4ach
         h7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622200; x=1794227000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GO0eQoXsdHBDsAY8r5qLcEfQWImjpXMenyB3OyA2xhU=;
        b=SbCsaR4lMiIpVk/YJcJfVyzOzDRq11DJo2JsZ7m2qpLmBCRXe0Wh1x+X906OEy9+gQ
         Q8qGCKJ+trWHXIlaRFSI1bUiVBOaupXmj8aPU1dpiqTL4pUajePaJVVdwLbtlK+tTPNu
         0ig9Z63UdIH8QaVMPGInt+pmz2AjxZGY7WM17vMoD2IDEPx4/6jKsF2/aLJVFdU9i2UU
         i75SyMr7Np61sP0eR9jaAMC+BrnTn0QPX7gxSHCK43TUCZLFgGwznA++7wuDyMU9C/38
         DvIG0gu4KuEuixetC7zcURxcRi5cBeo3tzNGBYS/Z4Y7/EyAfEKqSFX52oe9VczHIhFW
         a4rA==
X-Forwarded-Encrypted: i=1; AKwUvByhJXWB8sLhBehjdjcqhOlV8EuR4NNUBOpwNfQSqxi2Y9UPHtQ4DllClacRf9wDLJxZOB3fKM1gLgja2oY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGTfttUtTGqbLgGuFEC4N/SAb8LGNjaRh3ZHdSdVfdDfUMKB6i
	JD0phM1vNLzSTVKkfi52rt3128dkmAthjETMg+WgtIhPBTXGJJAE7GI=
X-Gm-Gg: AYBFou08J92HwQPPkFuaMGGWcx+KtsOL+VbAy9q4CcEh0wUR9a9Hq6QMVi6vFKq6WC9
	96oyA1nVprwSV7orqxdqNHKTPbAVAXMx2LbKLBgG5FrEqba9UG5zPAefwgRraobeyVOAD39wmny
	WeWhu7Hqi8/sXZhtWv6NEIgl9g5BkY9fIRE9AdxSe/glxzIVTVJnVprsorNY25SMIFaH79IgT1e
	8D/WET9RUhHrTFOhLluOYLkXMHxO1Wfwcad237ReTCXKiOfy0DxRlenGVvDSbBep8UwhL80fm/J
	r9hhWU6wo/SadvJIj1hmEsD3U/P8O+015iEQ/zbtTQUxog2Ya7Xc0aYmri6KLcYT2l3251ARxuy
	DL17LuEil+MRhq2Q0vl+VkzXuOZNAK5YHiUcV6NdCfmSXhJ071Yjp0Vqcy2u46O/KVchJTm+sm7
	Lkf52ayVAnJ1p/IkX5FAR+dHtdRzIJNnb70S/vQxVEZIzlosExBfTCs67j/j95wvQv9t7xd95Ka
	IW5IfjZlAene/bz4PiXO7mwesynRs5I5zHDhKqftL0t0ST1vznpaQemCiZBTVEB3SrMPVoRSQ==
X-Received: by 2002:a05:600c:c48e:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4ac16bc47f8mr229484545e9.11.1793622199807;
        Mon, 02 Nov 2026 04:23:19 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm255490595e9.8.2026.11.02.04.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:23:18 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	fariyaf@gmail.com,
	linville@tuxdriver.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH wireless 1/2] wifi: brcmfmac: zero-pad SDIO write to 4-byte boundary
Date: Mon,  2 Nov 2026 12:23:10 +0000
Message-ID: <20261102122311.181075-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102122311.181075-1-tristmd@gmail.com>
References: <20261102122311.181075-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

brcmf_sdiod_skbuff_write() rounds skb->len up to the next 4-byte
boundary and passes the larger size to sdio_memcpy_toio().  The 1-3
extra bytes come from heap memory past skb->data, leaking stale kernel
data to the wireless device.

Zero-fill the padding before the SDIO write.

Fixes: 8f13c87ccc49 ("brcmfmac: Split brcmf_sdiod_buffrw function up.")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
index 71c2f99cdb711..c6dd4148a44ce 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
@@ -323,6 +323,9 @@ static int brcmf_sdiod_skbuff_write(struct brcmf_sdio_dev *sdiodev,
 	req_sz = skb->len + 3;
 	req_sz &= (uint)~3;
 
+	if (req_sz > skb->len)
+		memset(skb->data + skb->len, 0, req_sz - skb->len);
+
 	err = sdio_memcpy_toio(func, addr, ((u8 *)(skb->data)), req_sz);
 
 	if (err == -ENOMEDIUM)
-- 
2.47.3

