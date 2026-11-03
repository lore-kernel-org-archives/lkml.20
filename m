Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793678976;
	b=I1L6KQpjNl92msasOnZCWpX28RrJjxwbxXVZwp1lYplcM/MMfiMAJ3N0ap7AQL/+sKev
	 n6R+WoANTrOgfEmbeoRXQFw13M4DQECUIz9MxfjvJ07a/plYVjqoSgNbs3/q7CCuLoYv1
	 evCdNquPg6uFOcLEz7YOUxptA1CluyjKhfrJRdQRJmZYJ/jLY9c0ygDIsZJOm7b75OXwt
	 1tzPXAC3OhwX7AcGGwrstN9jXWSrBm8usy4up8KUKLmPtoWNoJqJEtaR6oZbvtaHnGtdX
	 9J8tNwMKRY807/WHpUaqEsi2iV4eGHZXoGP2rlhmB3T+OHICaCP6JpsoMFn/Dm9H2Pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793678976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4iC8L9iLkA3pQkFSYs2y6EQR6cAV4OUXqfYAj5Wz1OA=;
	b=VZwnZd/EbcrQiQJfFpkdvQwIDsNA13IG9qB1r3cD0lhfJUUOtzHqF6z0hacD3nIACqBb
	 EIZkH1S3j+JgkbxVJDzp/4MwpbsmQtdolcz5mEQfx+H+Bemz059/NvnBq0PqH8uxcYSWI
	 6ru9odgslCIyzCaPywI+g9E8Af1jUVgyPDtKMafSQvII6a4B6KEEqrCp/jgrvkKYeiCv3
	 88mPy9SzmnV5DOhZGIln47UxDvHWrkS3qiBmuOlNlQueEt3VhaR3euWNtiisOv1QO62EZ
	 IE89wm7MS2ux/1B7M04qDAhuZ2IUSbA5kS38k5bPiIt6l2+5ms65JOf1EMtJFnHdhMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O9Oe40HC;
	arc=fail smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A79606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2A79606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O9Oe40HC
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ac65e845a8so2945001fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:09:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793678974; cv=none;
        d=google.com; s=arc-20260327;
        b=jviVhcWNHGh2+U0zMOyYd47ikvAGK/YL3koKcnQdVLTY0nYc9bTNbWI9TVUDOTMuQQ
         zN4cMP5JHoQ58m+2f6ROiNbL5TECvDJBFAzRCoYy3HzoBDcpJu0faGlnJfrOQlRpkl1W
         sy5YUPus3PFWn4Fkqg+SLEXxSZUHkZ1QLM2i9FVPyy2YnUf+jISCokhv3uvRa7kl6wgV
         X3aubzzdm8wScDTgBq373HRr+Qo7UVCHZ5WzTpwexjOcBsMHuXqhJulPRiqN+jlepDdk
         aO4YOHXfVSXMQR0RbAGd11xDKSa97tIG4b7npUuPg/rbPQE9/lOfd7hu/smhA4BLaGBA
         ViIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4iC8L9iLkA3pQkFSYs2y6EQR6cAV4OUXqfYAj5Wz1OA=;
        fh=6weIoxmnNWDza3GfHsqcbxpmKMhZrcPQNzkL0vJIYDs=;
        b=S2qHQLkTcuC1EpsdsORUy1qiynEm0Ys5rzrnzvGOAE7rvk/x5Rt5nZC0B82b1GiTA6
         x8QAQ7oX0MWM4JA+HH2YoUGKPVPhlfVEoGbTs96vZ4zgzi+r3LNmriPM8lvG/q9PcX7B
         nd0z482C8yLmJTNOUSICzctyDOHD2TVpYZeEhlfTkAd8d/oVryueQ8jLLqIwj/mIE1Pp
         syOLzCyJ9jGwA7UQ0z9mSeDoW1E83dHXP4WR+FaTbwGgZMtPcFpFqiKnz2q0MaeVCa1Z
         YbiJZ14MR6OXVLVcDDb0J8u5E99cOB+dh+PEj2I36nmgk74jU182JUwa0oSQWh0y5iKn
         Ptrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793678974; x=1794283774; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4iC8L9iLkA3pQkFSYs2y6EQR6cAV4OUXqfYAj5Wz1OA=;
        b=O9Oe40HCGOmRZfS9ArojsTOkWRogCLAA8RxP7OvgGHe4QdWC8+f/a/UhQiCIqrzFSR
         Zf9+JCBgW0u3La0oKPOF3Rm3Uo1kkRh986BsRwuHjs0+kuh89j5xdGlurOo3gPMyc4DT
         eQdNNZj8ulP6qpC2nI68ljZ9XYYIret2oD+U6FvbOdoNw4JucvZaChg+qPE+GY08uTXo
         8vZK1h0MpZlpqlwQFPeytDtE1nuBIwwFY62FfSeZ7gLvq4m72c3Q2bpGaL04KSlALTTo
         j7SvmBVy23rklLq9v5dKeZwEDM7ar4hvp+hQ03ssTzFhdy5tOEZDivhWCTrB87kxpjK2
         K5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793678974; x=1794283774;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4iC8L9iLkA3pQkFSYs2y6EQR6cAV4OUXqfYAj5Wz1OA=;
        b=X4N+FTplhJUdgA1+waNxnfCVXy2tXpbP+UoEzdqhsvYhsxBOFafK9wgP+vi9jGeOhi
         wlL84b/rwOLIgIsZiTTjwYbBbJjLYa34Rmn39y+mRjOt9ocpGORcRk78cYmYUkWLdKVo
         pC1kGTPhpNZAeB4ljgIXPpRi/g2S/4PmaLiGnXLIPUcxUA5IjMzAM5og/a/5fAvkGUkD
         gZEaypNPmvPnPBdYX7Hks61BS8RxLCrp+jfKEXnf+F3teYuuC6cfL/03nngbCIDhy7GQ
         OATtugpeWKHe/OePU5Ro7oJymtaMeVpXWqOIQiL7bjlcO93d8K7Wr7ceyf22h9busFw9
         LLvg==
X-Forwarded-Encrypted: i=1; AKwUvBzy7B/Sn2Qgg9QNNlutaiq3QMAVX3O49b8wLgLPTjfpzQry5MnSOvFfU7s2XENcNs/RQw4buwPgcJdo2YE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BRhncdqZbvPkClaDFeVzBhghByMZ1tsCZFDin9Zu1a9W411jL
	FH8i37xqnY0X5iaHDso1He7iO7z0mzv9oMFsf2/6/Nf3I+sX3a4p3Vg/F3AmOgO3ZSszLSuRZx2
	cPEX1GZErwbTOz8BvULurLeMZrnRFeYM=
X-Gm-Gg: AYBFou1bSBF9gH87mjhlcYUktLq9Z4NK9zyQVub8dwpew093eE1HfiFCWfJIf5IEA29
	MQQeNxbdkiTtWFXWUo2Q/paWxvyymZvk3STi+AZ9vDd19Gsh5nKmPiSPaNQlkXB5qU6XmlHcotr
	vWvkAf4jqQf+xxYCysJD0H9wkN4HHBGdUi+3UIOFUZ+hVmd5L9y0NxfulS/RCAsmns6s+1xj/Dj
	r7xVuEnQ+BrgNMl9qU14mtuKsWNyYwrklj7fCQGAvdT9SclHS8obRCVGtd/i2A8LjzA9BLsDhpg
	7ufOot0T4VHyvQ/YLwK52/F4e1KKToA8xhRJ8D7XPwdX2/tExfJl0db3c4Iqd7dqp+cqRRipT5v
	3DmPoRfjDlxduYzJriY49h+rY4Idu/jnJYlsk
X-Received: by 2002:a2e:a99e:0:b0:3ab:40b1:c4a4 with SMTP id
 38308e7fff4ca-3aca57eb24cmr35150011fa.14.1793678973932; Mon, 02 Nov 2026
 20:09:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260926041943.1124650-1-oss.patchbox@gmail.com> <aujDcTjvpWbIJ8wm@p14s>
In-Reply-To: <aujDcTjvpWbIJ8wm@p14s>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Mon, 2 Nov 2026 23:09:21 -0500
X-Gm-Features: AclHuK_exdT8gjqeTXLCJXxzkdg7czt6b3ePUopm67pTCoxxb-Of6GIPUcH4Ph8
Message-ID: <CAGG=RgBW9O7PfwaDPY_jYkE876EALQ5JsSnP4=7YubZg1XvwJw@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: virtio: Synchronize virtqueue teardown
 with rproc_vq_interrupt()
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 12:08, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> This patch doesn't apply on rproc-next - please rebase and resent.

Thanks for checking, Mathieu. It no longer applies because the same
race has already been fixed by commit ffe14d610cb0 ("remoteproc:
implement synchronize_cbs() for virtio devices"), which is in v7.4-rc1.
Therefore, this patch should be dropped.

Thanks,
Yuho
