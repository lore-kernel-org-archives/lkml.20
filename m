Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DDC388392
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198119; cv=none; b=oJScquo2YfDJJmDVysGqx/GvnHlPdHYFRvTr7gxnIIBK1IZjgn4Jd1mU3Ccuvqu/Lhphl71mpqjOGnX2rfIz0YlPtlSRtwXq8MdeW+R27qQS03UTNizxFx+8OZB3cp/og2W5QScNcEjoaFNnuiNZ+FpdNBW0WNBRJhdLWuK+np0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198119; c=relaxed/simple;
	bh=mbitNxCUMM39R4YGaQk34WmC5X+e/RPNv6Qj029D3Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lHf2qvoJHnlIQgljbunD6iQh5RXUmZZm+twJGHqy9ZE+7QgauBD9r+hbwhwtDKOijs1acfVVM1A9SD4D8vRg+JOGcHYrtH/hb6ImoP5SckDAn4UEH+zzrBbvkbz0O/Mr9fqGQvka8YHebIY7VoMrixe6tRqwC5Py/BjE4xkf95g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhYo52Jf; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhYo52Jf"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-3396cec93b6so1470990eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790198105; x=1790802905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+mi6zIs9P8zxgX/W5h8qHY1aY4dnKAV0RC3Zgyj9agc=;
        b=hhYo52JfAsD52kKOKQN1vkhHUJBQWrRWPt4r2y3MS3lKPx9oc1bJi/ypP+lNTlruZq
         4LJPrL3GeoQcV6P7atDgm2xB3f5PoP38ZenbeFlqd++Bs+Jkf4/Hn2zmX2gIQySlFL9i
         SzC4cxFGgt4t+VZsvHpv/qGrZ/kBDKi/s7BVy8cFrazyV49cbyE9e3Vu9x2RHOBAFKHe
         gcJrLSuBrhjsAObrldZjHPPahllLb4CwbLLxp+8MwBT5Vldo17dTfZYUbQQ6Yr5T+Imr
         HEp4t0p4oUE3GBlTENPY5PgCr+1CfWgqNQgaKZNjGhvfxQAiLE/8Joe1vDs8q8YJnLwv
         khnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198105; x=1790802905;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mi6zIs9P8zxgX/W5h8qHY1aY4dnKAV0RC3Zgyj9agc=;
        b=2p6PafQthmCw20e/3Jt5guM+ancsamlKgWg/dyzz1HPZmEkW2KycjPAARIFU2V00m6
         lGmuSbFdeHbB7fINbOFTaxdreV7akJHUcu01HW1uxgdseJWalrc13rrQJ3RLlPMyjUP/
         4iHtfxIgtDBIhKorB+YJ656QOgoBbaeTIBe/otfz5urOzyh9Uar1Rjaz0gC74P5Om8k9
         ynydgAQtg4IF7WdeV0MWQpwv1sKhX07j96dkuabctvnfhx0RkLMQ7emTWewSHLvilLyl
         Z9sUbzL3MtxYX4Es6071Y2hSPdEX6uqqzFTHqnOJ9MZQfNFhUFsbjSJ6v+5s0fnXghdW
         A7EQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHvzq2qKxcpFA3ygsgxG7W5xh5SsAYrpRhsPAMJ6KIf03toF89MG2D0GdSCKeW6nHbnhNyiRNpm1Wfgsk=@vger.kernel.org
X-Gm-Message-State: AFuF++mLXU45BnyHj0AoGaQMqHUrUTLk6UvqkR/i0JX5W0ad3kMWqXFB
	46+fk2gmjFE96wX6YkmffDHW5i5MfXXpVLUT2uCfiteqlZujME0c1D7U
X-Gm-Gg: AYBFou04sETUUwU6+K+VsOGzbFcA867ci8q0TvGoauNgqg1i8TpkQVDzgYKGfWi2Hlu
	aZdjELxPTHtNE66ON16IadjUPa/ai4hAVJqiEnJh7qD9gIWx4YVENmANrmXQeGdP7ARIKv8Nywx
	h+CjRP/8sutn4MX7Yq0daGBDn7d7Z/exoH1bgH9h5t0CkBJAhf5jMMqRt8leIHKlsMzeC+ECQ2o
	JjcMigQpUFreCca194z6b9xgcMyZJXenOh1bpcUHQ+G+nOFHCGJm2KTlqyC7o6vjc07OIkMA9cl
	bke3nhZduqm3zsGUTBJyd2a9UkBTdrapmm8g8FeU6VDWRhOkmSnVq9vQZjkxy+8k3JluvwoRySo
	kLlrK97LmVymR9JejygR2KhdDG82XcHyTuideBIqLwbExvbrgPEhIyM9uMDNUOwKk0kpL+0KZUG
	8fLv3voPF64K8S4G1qOGj8Na3jSBAZnhOL8RTZ/DqYQZXJfqPn/hneQj/7eCfW6CZDluarIEXtE
	/PmIGx+fl9TzULUgyr1kijw9xkhig==
X-Received: by 2002:a05:7300:b291:b0:33c:e9d:6d49 with SMTP id 5a478bee46e88-34003baa73amr302118eec.39.1790198105220;
        Wed, 23 Sep 2026 14:15:05 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.192])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e97236754sm6863234eec.29.2026.09.23.14.15.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 14:15:04 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/7] HID: hid-lenovo-go: normalize calibration failure status
Date: Thu, 24 Sep 2026 02:44:58 +0530
Message-ID: <20260923211458.32755-1-mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <836F1B09-60CA-4A82-8293-0F9CF506E593@gmail.com>
References: <836F1B09-60CA-4A82-8293-0F9CF506E593@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Derek,

According to my observations, data[1] seems to give the correct status
instead of data[0].

device_type in cmd_rep seems to indicate the left or right controller, and
data[0] the calibration device (gyro, joystick, or trigger).

To validate that, I ran the left gyro calibration on my Legion Go 1
and failed it on purpose.

Here is the raw data alongside cmd_rep, its contents, and data array

  raw        04 00 a0 02 03 01 02 01 00

  cmd_rep    report_id   0x04
             id          0x00
             cmd         0xa0
             sub_cmd     0x02
             device_type 0x03 (left controller)

  data[0]    0x01 (gyro)
  data[1]    0x02 (failure)
  data[2..3] 0x0001 (reason, little-endian)

Reading data[0] as the status would report this failure as success.

Therefore I lean towards keeping it as is.

Thanks,
Aditya
