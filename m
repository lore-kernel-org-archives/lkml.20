Received: from mail-wr2-f43.google.com (mail-wr2-f43.google.com [74.125.225.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B413C4078F4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231010; cv=none; b=bmZ6nLaMRlOut4N2zdDNezzGwRahHiN9J5NikqwpvkpbqMiSA4v5mycmE9kzzc8ByxUezNXMm7JajLheNTcEV4iHe+KzmgIo8caCrOFi+gHx5PknyPWRikVSqNfrlVLzgSqOC+UfZmTwVbeeVqotrN2IVHvQ45J0H+6hP1b6fp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231010; c=relaxed/simple;
	bh=uapzxMEthDJO/bmR1HA0Vq28uQP+GCz1/k3zL0gE+FU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o1vSNbQ40OXfxUVQebHeqRJ8d4IfmS2g46hlcfsJ4jHerTMBKs0H881blrdLNsy+UeAGmVwV3+26s9m5q/StezGhNU0shSmKCUWFOXVLIvxoDtWxwcqzpOdRdjfRn6gkq8Fd8SLPfAKCt+9uu6sXJeIj+yoskph5t2DV5la96ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1XM6KL2; arc=none smtp.client-ip=74.125.225.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1XM6KL2"
Received: by mail-wr2-f43.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so681080f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790231006; x=1790835806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uapzxMEthDJO/bmR1HA0Vq28uQP+GCz1/k3zL0gE+FU=;
        b=C1XM6KL2Zmy6FipWpR3LJ8qsJr0sHSCHebPpvpSvEUtQLur6jQwjCpgj7oiQBWgSCv
         mEjwZfA8F0w1yVd9IzmjIkJZ/zA/kGMsRzP/SFRVuY30hevsbMZpOjFPZQb7L9h3Wb19
         vmGIas/l3gk7P/EdGIMvRwh3EKKHSySrTf559gGt5Qv27qHB6IeCWn4OtYuej9MrAxn7
         8TgBD+oOFiNnrsYn+Sz0pKnju4IHUah35nJuKUfqlNLaS5R5ykkk0fVLuSnXhP44guKR
         zlo5dZYE1JJHXshPsWlBLSChE9JSaOeRm5v4ZlDJuksQUB+TDDCKjqhauwnel5xmwfqJ
         FBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790231006; x=1790835806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uapzxMEthDJO/bmR1HA0Vq28uQP+GCz1/k3zL0gE+FU=;
        b=t00K7icfZqfp7AyuSgOa4OCqJ7oFnSKWOYwQZBgjpPFyeQXhFinlOTz/qE3yN7pnOY
         onN2E7DRk5IKDowRFdyChjKywjjCvfjo7+9mPxrWLCZjOWVdpkpkLbMUJPfhFDhPcd8M
         pNYP26E6SG3UzfqVOXHdhPw1s2ruMxlKOAOiVg7h5rT6thLh3t2rInZpL7VWM8BCdHTJ
         7W051T56AM7o2202BTYc34PZqM+YwcPjh1GjIrAOUvciNQNsURuuCBhrscUF17D+Lw41
         h0tO6nxFPyTnaKgORguTsBCUJrXS4hSboP6h1B7Dv73c+cWLU+IaBKAFb4IUUWJcQLhL
         uwQA==
X-Forwarded-Encrypted: i=1; AKwUvBxlGR/E5JuerepIL32i90vOrxSqaZfXcx/rj7qM8DtxwGBB+GxYsRYyQ54IDep8BuWb4F96xhAuu+pQUlw=@vger.kernel.org
X-Gm-Message-State: AFuF++lhcvpJ7cFXmvaq4ZwPpoRgeaCXdfaDwtSgwuf53BvLMqEbUgis
	muSjTZ0cJUYCytGGBG2oLT7bpA/l2Xg8TiXSg7pxsFWWVj28afimLP8t
X-Gm-Gg: AYBFou0FMTnGs5ynL8V1T+uakY1Lgd0GmaYdiSl1Fxtz2xs8scEyH0UOIrgGhFCYy+Z
	/DPzfUl9YlLZLFBrK8aokVOBPbrYbweh+pEwxArcaU75i76DhTzyOMHhKpGJmU9JeGA6LEzRbgu
	HOImfiqsJzVM6I8Gcp+wind+63qJjwTn0TEffq24XHTZ0DhYkYSHAjziC29Zt2FKL4iW9WvA2T5
	QNhh8Zu55/l7MrWLkA4l9WIr6gozkFyja6yKMYVW2XxvWOPLQl2//bvHe9/5Lo2bR1EEa89sfGH
	LFJVTwBM8Jkp2M2bKTuIauZJ8hcout2lnPcfDin3b9seK+5+u1i1oKPa5BlvLaFM64zMu1IaWQI
	T0in3yzkU/j0KYFn1uFphCpxF/ta6ROCyBcMxfa+2sCsQF35W3hCHlJlW9j3VZugAWK5xvkdV8r
	NBxrRo5GY89o3zNSBJ0mDPUbtMSfAalL6wmABBJ3dPs6mxH3ZiODfWAlxTocJvWXIu48ajOdHMX
	NReQluMc4MfMiQrxYbYCnFYiBdRdxCL1HHGWlLUKZT54hSjLwuec9eZMGuTCpEsa/3a4NgpNd+j
	jcF7DSA22QUiqR16Kq40C/CdNAh1SltMXOnfPATEAJeohASi4+8lXyDT/XNubLOCOyqiOtQxTk7
	WarS/mb6s3fw5xAi/uXeATWU=
X-Received: by 2002:a5d:5e03:0:b0:488:63f2:8779 with SMTP id ffacd0b85a97d-488716d236emr2306396f8f.21.1790231006325;
        Wed, 23 Sep 2026 23:23:26 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-adbf-6901-6c54-85ea-c6d5-a48d.310.pool.telefonica.de. [2a02:3100:adbf:6901:6c54:85ea:c6d5:a48d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889376sm9713823f8f.33.2026.09.23.23.23.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 23:23:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: mm: align hugetlb mappings to the huge page size
Date: Thu, 24 Sep 2026 08:23:23 +0200
Message-Id: <20260924062323.55651-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260901085740.66283-1-kmehltretter@gmail.com>
References: <20260901085740.66283-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A friendly ping on this patch. I came across the ARM32 alignment
issue again while testing Ackerley's HugeTLB subpool series [1]
on v7.3-rc3 in QEMU (Cortex-A15, LPAE).

I've now retested with this alignment fix applied on top of the
full series, keeping the kernel configuration and test image
unchanged. All six ordinary HugeTLB mapping and cleanup tests
pass with both one and four virtual CPUs, without the previously
observed panic.

Would someone have a chance to take a look? Happy to provide the
configuration and logs if useful.

[1] https://lore.kernel.org/r/20260916-hugetlb-subpool-always-track-used-v3-0-38aae9b5ccdd@google.com/

Thanks,
Karl
