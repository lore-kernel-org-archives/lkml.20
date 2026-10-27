Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124353;
	b=ixLFGASEQkipCqUvfjQ2f3VE19Dv9c/qHyZrze3vVjjrgLEnsBKW1+PSKodEPR32tCZs
	 f729ng2IFy9OGDt2KT/RfhWe1P1ZonFZTbacDQPDVWuJuuDaazbjYK5MsytC2WzqPVwZU
	 QPNi3mV161Tq2Deivg9E7SkWhV73iP2CkuoLyL4U5p3ixrMJOg8ymzn4hPugtLybo0G9o
	 ivemVohCItkCr+Ecm3v+jeEBUTK96O5yv/nUIiy09sn2fqSTyXpkm9mtaxQIlt/yLIsm0
	 UrolF26bUrc+6aF1esEZ4kVBFRC8HLh0Wxmw8ZAPjDr2AJHu1/hnLThV5ZUUUHHFYmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=BiajcH2NlShTUuuWJNWODcIzRZvnB9nBz3BjPTp91sQ=;
	b=Gb0knNRHDjTqqCK1V/7Gwqjbip18yWweaqgCz33k2jzFYAhl5y+Sb2Fd7V+yu8XAB1Ya
	 6pUkHAib2Zznz1JFeJ1mMNi3JpICTqkkgmMea+e1ItJolrJfBi+s+kR/Qv6bIPwp3q/Kd
	 cd4AEJ6/9/N7OEdfgk+H+6Trpl07yLXozQUQzk88fWnMYHbUh4fPqua22gQEMEys7+50U
	 moM299iAgqpLq0Qdt4ismJ3anMH3vZegka9xTVunaVxLgKKGpz/yElYACea2x0/BHwNQT
	 0S38YWYS5reaxFgtGaL0j0rYgbY+gTYlR+aopc4PI3j4G7Of3IHjVCB/YEQf18D3i9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjC71WDp;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836E7606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 836E7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjC71WDp
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a215e64962so1499665e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793124352; x=1793729152; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BiajcH2NlShTUuuWJNWODcIzRZvnB9nBz3BjPTp91sQ=;
        b=wjC71WDpudNxsBmkC+HUupPNM3w1LrCXLfkkBxxZfDsa0qhcrOKjoQ/YNIWqX12EfX
         NInLwkqvGLE3q8LxUWANF1xanKknrqeYDj1E+QWq1Jn8GQ3TUPPI9GW+XH+3iUs1US2d
         yhM3Ii/z+dLDQtgeOtYNozep7N/bFDSjpTAu5houmKUkFFeoRt75jg5uQsRKHA2Dgmnn
         KgKt6IRC2L2JIrSxGIx2VPeS2aYKNY+TNHh/UTTGeA1lB2mBh0zM22JHmtYMYnUh8h6q
         XCodVJ/7BzW0bi7B97fsjOo1NCVvNqgx7xD24BTrfFqbEIYNAS6mSaMsUARSoXqam2uc
         TxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124352; x=1793729152;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BiajcH2NlShTUuuWJNWODcIzRZvnB9nBz3BjPTp91sQ=;
        b=TDXWxKs5HCA407wMUt9N2rR/vxUA5ieEqFe1uWwsIeXcpaUk49sk0bgpdzjTP5GPGm
         S2ZXjb1Ue4JWnh20OQsnSg2VJhaE1gFjqYyw4Ix7pgw2TgXVKpGU0EU4lQ8OYAVYYLr5
         UvlPyGkgVoKBK+dSpQnHmWb8nhc1sspRFEstpflz7KWVwFGD/jXOMju5e/wx6S0EYwnn
         25b+PmrDE89hpQpNAU+m0aFzWzU8/6iQVzD9ZROWrGHfSAoq+Eksh2JsfT29YDbvtgHy
         NNF9Rc1SiVuV+Mc+R8wxaHWJ88qbgaJpTaPMmaB9/8KVWiF1ENJtCNLTEoW7q4+psLRl
         CAHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfejxWnljUtjxB7eZF9wrFkSmxT9ZbEPdbkZIfwKalbcEWKo2OBuDx9AvzQyX7B2vz2Lb4KreRgewo9OQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY5Toyuw1vlBnjm+2O2tlwG6Lt3SxpRDUZki/AbtlDEmPrbOPj
	io8RHiPJQHOtpqkP1cgNrIQzUrHefU4668fwf9lqSo314nY4MUm0SmDk
X-Gm-Gg: AYBFou2Qx1ggN7PNJbcafuLiHIkwKqdV0UghIP3ws6BOgWBcsbpR533unuCXEChv1Ti
	RY+wWiXhi93XIMs6rctMDLMYqtTmfW9Dwk/dHCGUkFSZJbOmfPtWhUsJmTsuX6eR5kWRc9PvPla
	LGDDWhSILP1rDS/dx27v0qsEsszzBBzB0oDhpicv9oVGKUt/kcN6Xz+NlE7czb3jrV8i4F4rv7S
	HO/2iicj/TEzYp5N/6FMyAlSHXfaI+mrjqFHAX7pBMTSZPpLn3Omp4B0WpOburoRYtlBVKPbSdc
	ZgRUzZi4FuIVmrz4VPDsi/2NzhNLqxQRtnQScXZubCmg+NNw3bU36groMqFNMtUCQRRBKvZCYRF
	MBmVfClMGk3FlIznhMck0U3gEVyeSU9khj00ELzt47qN+fgZwoaMQdQ12rHLvjT5MbGdcHW6E8/
	z6RFEpXvu5+/HRAfr+oh0yirr+oNHhjhz6KbzEuQCxqbT6+0SfZWdkUIKf0TBAlwLU8xf26gmCJ
	laPDu8J/PspllfOlBF5IRdPTsLlBkpujk0jqMKdpQv3o1wlJX0zJBF+rsBjassJzcdsMMKwghpt
	ehssUklM
X-Received: by 2002:a05:600c:8b41:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4a77d22c51amr93525755e9.2.1793124351725;
        Tue, 27 Oct 2026 11:05:51 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a92bd50b05sm8192805e9.12.2026.10.27.11.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:05:51 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 27 Oct 2026 19:05:43 +0100
Subject: [PATCH] clk: qcom: rcg2: validate frequency table entry in
 __clk_rcg2_shared_set_rate()
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
Message-Id: <20261027-rcg2-avoid-null-ptr-deref-v1-1-43c21b54cfeb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bsHMSvpKdJBcayEs1oog+nvSc
 QZmHkgkTAn64gGhixNvMUNVFjAtLs6E7DODVrqtlO5Qplmjuzb2GM91xf0Q9CQUUFnbmLpurHE
 Bcr9nyff/Hsb3/QC1uay7awAAAA==
X-Change-ID: 20261027-rcg2-avoid-null-ptr-deref-0885433584af
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

Commit aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
removed validating of the frequency table entry pointer returned by the
qcom_find_freq() or the qcom_find_freq_floor() functions.

Since both functions can return NULL and the pointer is passed directly
to the __clk_rcg2_configure() function where it gets dereferenced
unconditionally, it could cause a panic.

Restore the sanity check removed by the mentioned commit in order to avoid
a possible NULL pointer dereference.

Compile tested only.

Fixes: aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/clk/qcom/clk-rcg2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index d7914e59129f..260e90f53461 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1385,6 +1385,9 @@ static int __clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 	}
 
+	if (!f)
+		return -EINVAL;
+
 	/*
 	 * In case clock is disabled, update the M, N and D registers, cache
 	 * the CFG value in parked_cfg and don't hit the update bit of CMD

---
base-commit: 55981579b27b6541aeeab81c768f248dba0491ac
change-id: 20261027-rcg2-avoid-null-ptr-deref-0885433584af

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

