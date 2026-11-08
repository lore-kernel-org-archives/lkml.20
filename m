Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794115493;
	b=EWqKYHesu4hShit0qfH8FrhqwtMStrH9eJ3+40JPCHMUEz93cBL3WfPM9b+JQdtnipFm
	 SRUW5n93KjH+fHRDp5RZIUEkK9Nymmo9nidW8uUEfs5mTNSARBselttdfuLcl6go2ZH92
	 kfCRap94B8D9c8NvkAff5xDH0loC/F6+IlJDT/QDXVTqjE8QacoiU67Um6CjgQd141i5k
	 BdcGxX5XCIAxu4izf38JYmr+180twhtYznkb4mi9zG3+kL3mgJdwLzv5Fc97IvqxdHD8g
	 d5nHNCffO9jGqFJge1eKkqdCZl/naI0fnLBJned5w/lXNv2Ek9WaQR0nvOc4YU9HpUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=lk+rm88B0oTn3JFpBCPa55zvIWRJD/9kM2yE66jnksQ=;
	b=4Wu2+fjj3vYtGhpBLShsjOr/9Q2pTnRLnA4QjEsiB0kqjeg/loHluyqUPsv6panvsTzW
	 +TLZYfxaEsAUwNTyE4aQP6451TfdpoiHnrt1CApqSGbjKr075zrM++esXx4Urdb430w78
	 xlM+gWEkAqitH8Z34opUk3fly9ZWtQwq8zufo1puzM3OVhnk6OEBDVJoWMbMBRBd0YGKl
	 GTzTDLltLfZGUqp8s4f7rylV+YZbUrV9vGm9ob7AxP5NhSs10FpKto4gRcdLOef7fRIV+
	 u4IbaU4Tq70Ihsl4PZnWTzC8pjyBdfxE/NpNdnB+NLnBFDdyqenlCpKnjokBjHT4HQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1GsTo57;
	arc=none smtp.remote-ip=74.125.230.193
Received: from mail-qk2-f1.google.com (mail-qk2-f1.google.com [74.125.230.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01B4606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F01B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1GsTo57
Received: by mail-qk2-f1.google.com with SMTP id d75a77b69052e-534b7b19206so2850641cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794115492; x=1794720292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lk+rm88B0oTn3JFpBCPa55zvIWRJD/9kM2yE66jnksQ=;
        b=S1GsTo57AxOCV91sywu/ID1HZT25DnHCqy4omjZRaoxKM9pvL2R5jJlGpigiazXIoa
         Zn9aKYvfDLBV7LT87E6zOV3aqYxJMtuucbXAcu7r9pKqAEtnRt7bTnZsgEk8ujeNvbKp
         PKs487c/Wlkqa+ENvEd1/xxPoDJJEzFLA17ix5SC2M96XjntGmob6p6FyEcCcfPkD3bH
         rJm8/xIqKUMQ8eyjzeuqcOEXcLp0pd0KmsxMNLYrR0ouuOUlvoK6rTLMQ+JwKe1zxa8K
         d04Md+aJ1x3RD/6laoHFimo0k6peTAbCvHCPNnVcYgm39LY7WWyByb79nuPWo++r5DTX
         wy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794115492; x=1794720292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lk+rm88B0oTn3JFpBCPa55zvIWRJD/9kM2yE66jnksQ=;
        b=jDL4tAlJZCWP/BUSHn1Hk14mKF1Cu8ddfPNVhHk5qso6JM2hB4Jyq2V6DlolJ+6GU/
         /yPh1/3fbwaPxjNBB5KAeyh8BDJLrzb3tek/y5csZHikUkVxI9LiUZFRAcjKHkgjHCTu
         7KOASlmtvfyWU/VbkZy6X2WI7qXj2/0T/b6PMePcX++BG8QcjUbueWMMxSUV/AK1EK0o
         alIExCCpLzJ5EFELtoqMT2JSRQTW3HtNOQYrr3iJRK/pN194nfOyF2Iizh78yJUsdIph
         07ZZN9y7ppe5MZzQOVt3Rtc2+7dO+mqj68t17H6MgHa290aOeQGMMqfbrRLjKJKwA+8a
         YhpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcQPJgfsKougPLiiFlpgSouhQ7lOuQZ8s9l3Mk5emcl7HSfCZTNaDKMzkCXmqN8ChXVI2kVaS++j65VEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0zrTX6A/dJyXdiyTAyhtEEPdr231PG5kvft476GZnRJk1NhP1
	QNsl030SmCbHclELCdfUv9qwZC6wLVA33g+VKh+NzP6ntEnWEXD1PT54
X-Gm-Gg: AYBFou2D0riyhkIecIVxB4ZyNokVu80CC/k7+njVLpRMuF02BkJHJ/GbxH8sPfeDkPT
	AM6TJB8oiKd07x2iC2p1I/vt3N/b1HHIRxUC4GOYdhu1eiqn7BXScN+4qlwIUdnwo6XWrQwcTDw
	b4/ewvDFnNLs37f54/YftVOg3USRA3flwXGdnrSDmfb3odU4xmnglrW/AqTelUd07GJX5pWYHB0
	sa5LeA30bay1FRlkRBzpxB6mqCrf1drvYmJteuheZKvKiWj0K/x3ZRYMU47DfjgaUDkqcb3ven7
	SrBhFMEz/50+HATWh9mnJ4g4X54P0ipXxjt6aV8B2pzDht21SzRiOXez1R08uHBIzRLGxfVK5C2
	SQzZC7ayAzFNCmeYACWljSVKg4t7V4G2Wx/he2fQatE4aEYIZvx5t190EtoZqU9NjRCamQvnOvH
	tlkcqml8ZSXhqknHxrTq56OKjfzb6SL/xB7TGgjCqYvJ4HGJMZpyckomTKVjsL4MvuadMi/tiyH
	bGkn73Xyco91IVmoXN8OFTViKOAbuEiGyT5YZ+txzVI6Q5q/zmWBpkSpnaqYWaJ9Q21u7KbbXXd
	dqCfZwQrf2wjUZkaUg2NuX0PkAwzs6yKpfUkvpDlT16jjPR78XIy2KJp0kh+drNmc1hjkdAZADo
	t4ldkiSnPszop1UGHLAkSy2IAeg==
X-Received: by 2002:a05:622a:1c0e:b0:536:65fb:fff5 with SMTP id d75a77b69052e-552a59777b8mr7617241cf.60.1794115491901;
        Sat, 07 Nov 2026 21:24:51 -0800 (PST)
Received: from [192.168.50.20] (42-98-155-143.static.netvigator.com. [42.98.155.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55264249f97sm10491941cf.14.2026.11.07.21.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:24:51 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Sun, 08 Nov 2026 16:13:34 +1100
Subject: [PATCH 2/2] drm/amdkfd: check HMM errors before testing range
 validity
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
Message-Id: <20261108-kfd-svm-baseline-errors-20261107-v1-2-9ef4008019ab@gmail.com>
References: <20261108-kfd-svm-baseline-errors-20261107-v1-0-9ef4008019ab@gmail.com>
In-Reply-To: <20261108-kfd-svm-baseline-errors-20261107-v1-0-9ef4008019ab@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philip Yang <Philip.Yang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, 
 honghuan@amd.com, honglei1.huang@amd.com, psirt@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

If the first PFN-array allocation in amdgpu_hmm_range_get_pages() fails,
the allocated HMM range still has a NULL notifier. The validity condition
in svm_range_validate_and_map() calls amdgpu_hmm_range_valid() before
checking the error, dereferencing that NULL notifier.

Check the error first so failed requests retain their original error and
reach the existing cleanup without testing an uninitialized HMM range.

Fixes: c0de552910bb ("drm/amdkfd: clean up the code to free hmm_range")
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 8184cbbb829e..79455e23a030 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1901,7 +1901,7 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 		 * Override return value to TRY AGAIN only if prior returns
 		 * were successful
 		 */
-		if (range && !amdgpu_hmm_range_valid(range) && !r) {
+		if (!r && range && !amdgpu_hmm_range_valid(range)) {
 			pr_debug("hmm update the range, need validate again\n");
 			r = -EAGAIN;
 		}

-- 
2.56.0

