Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662263C98B7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715937; cv=none; b=bWs65QGvI8ogFkHH02g8kMra23rYfrg/aM/biBlpKik0e6jw0rbKClKOA7caf5hS/7R+9E75MW5KaU05kDiYvintsXphWdtD2OS3B8PxlmHOdWQHLSo85uIF1qqtcg9UdHLTnqFOdB+s8KqSyBvGEtLGa5Iv8d1VPT3lQqx/58M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715937; c=relaxed/simple;
	bh=DByqLeGFPLw3TJVUX1MfUPhScKwNvQQq1GjX/vQm28o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLptF+YH5Tg70pUJIfMa9bc+VDxhJ8aFRlVZoRkAySKgacGWsh7FS8pS0r/Vyc1J0ri9U3UQ+EF88+5KAeTrqS+xSdZRlfzSxrxTNXpy8xW45QvXvNWna4mAfop7WeacWFbYMe/nOW3ZYNWBXuR3tgIyTOJjG+130vXSLsCK+b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZKKoP9i; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZKKoP9i"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso3639904f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790715932; x=1791320732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DByqLeGFPLw3TJVUX1MfUPhScKwNvQQq1GjX/vQm28o=;
        b=gZKKoP9il0Mhnr7m1zdPljHNTEL3uqTCa+vUF4V85tyqPvojKTvZbJjBfI7LMzCKeP
         3kyqOXVL2J53c+rZ/sgBRY2bX14MpWo+ah9X11AcF2w2TToRldC1bnFuyY5aysFls26g
         gu0ZHatYAZXKc2i6vhJcXyhpNZ2cdnvfKYraIAbiLnDOLShJRgxVeO9K7taysraKagW1
         VnYEsOdwR3a7Vk5OsDN7adE//l1qBAN6QCzg9UuB0AZ957fqvWcBzxNVA4tOEyzKuc+8
         V6hDNTuyXxb4EGh26UQ1VVd9n3V9KYgYhgMTR/s2cp1zlLi4Wdjq6YZ41Op7W3l4PdlE
         kF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790715932; x=1791320732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DByqLeGFPLw3TJVUX1MfUPhScKwNvQQq1GjX/vQm28o=;
        b=B8bL7UcQsLwFTCWEiVyG9uRR6/j3TjXpDcoLRPW4S+RMh6iHKaz+3I1bv4Z5VI0brh
         AvcjqI+uWAY+UgzFRh5upriwjCriy28CNFA31NL9O972/uB+TVFlyqf0EjaAfAhx4WFB
         bqKiK2Yvih2I97gbuO9mVNGOeaBeyiknhWEHWgvlP2Yj2747lhl1Bhumvj8ORPKbESN/
         8AwYCt3lyMlqdnuqjIWAvpK0NmJOu2KOnYpFdPVmLbORLZYZl2UB3AMmnEzrSk9Unmt0
         TcLDIDYwtnHZDXJhEZVvwQmOlkh1RuN0aQwZE+4mqTiDa1O5T4ItTB0RQD7wiPbhzveF
         4f0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzWuKZnS1JxMyPco2fakFiEjd5/wzCwfOQzi5K3Bmwv9CuPPX3V2ZvozLRsW2veKXgSFkuv4dkTtx+8ONY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/TctJcnikPN3R4UMGtGw272QkVRUgXKMLwEf9rzs1kGpoNKxT
	h5oyodzto2GMVmLdwLjr2XV8tcmdL3Khppd3Iru12v2pDs5b06BFC2eS
X-Gm-Gg: AYBFou3xb23t7UjrcofjsrQvWZVCab+4qs+9d90hrCcXvqvMwJcq9jDxNH+ldic3BYR
	HuKmqdeo2E8+0Ze2YMjQ5yeKALYp+5Yy4O66fw6MWc+j/+xOhH8CwAAeAiaXlLeFjvN4dXT1cxE
	xoke3pE1AMgFp07OJUtwTGmeQael/rDlsJUqLIDopVrqwRFA2tUXAldinJFoKiLMJyQ/tGpdmaP
	PAkhTwSus/Xb9sgPPPv1leZghf59z6PVKn41BnxtTUl+ZPAZ85mlh4e/bxiJHQ/OKz5uzhCwi7i
	Hnb9+eUUCgJ2BLfMNfP3//BBcSgO3ct1reEwggKzr+HxIRWVkO3ggd1wLUyguy6iKRYRcgNrqU+
	Ry9T0ne/jaBPtLYd+YG9AggTIesWV9WvaVfsX5t1CaE2RwIJAhOFJI5vWz2ObooJ5b9PM6usG4D
	buzvHtlEXFfDG4d+3y33VscMkbs6Vb2qj4UMpUMCbnGT3M5+BknCY8fQQLmBqL7DPL8Nzk67D3S
	TcQ
X-Received: by 2002:a05:6000:240c:b0:488:5db4:791e with SMTP id ffacd0b85a97d-48afe71cea2mr1016150f8f.11.1790715931559;
        Tue, 29 Sep 2026 14:05:31 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48afe6c1260sm1409464f8f.33.2026.09.29.14.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:05:29 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next 1/2] wifi: rtw88: download the beacon the reserved page was built with
Date: Tue, 29 Sep 2026 23:05:28 +0200
Message-ID: <20260929210529.1848479-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929191136.1315-1-luka.gejak@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Luka,

On 2026-09-29 Luka Gejak wrote:
> This breaks hardware scan offload while an AP is active.
>
> rtw_download_beacon() no longer fetches a beacon of its own. It reads
> rsvd_pkt->skb, and rtw_fw_download_rsvd_page() clears that skb right
> before it returns:
[...]
> Could the scan path fetch its own beacon, or could the retained skb be
> released only after the standalone download, with care taken to not
> advance the CSA countdown twice?

Thanks, you are right: I checked the callers of
rtw_fw_download_rsvd_page() and missed rtw_hw_scan_offload().

v2 takes your first option. rtw_build_rsvd_page() hands the page-0
beacon skb out to rtw_fw_download_rsvd_page(), which passes it to
rtw_download_beacon() and frees it afterwards, and rtw_download_beacon()
fetches (and frees) its own beacon when it is called without one, which
is what the scan path does. So the countdown still advances once per
page update and the scan keeps its beacon.

I can only compile-test that path: the 8821C and 8822B firmware on my
dongles has no scan offload, so rtw_hw_scan_offload() is never reached
here. I will say so in the cover letter.

I will hold v2 until Ping-Ke has had a chance to look at the rest of
the series.

Best regards,
Mehmet
