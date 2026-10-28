Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219826;
	b=iTCQLVd7bw94KtVhmqIINMWlrmUzWTSYIY4+Paq1PpdgdpI71jXVQ78CTU1yc/Y1aQge
	 2l4FVLbGwjb0f5qPiangBIMNeapgVBRLpMepv5q9BWhk8/u5Lmz3iWqaRj/yC+3O9EsPS
	 bZ4CjOSGF/TTLvJdryWx7/mIHIW9oBIrvWyMtCvyKeCI67MP+lWokCngDuqka1QqqP6Cl
	 oPG5yYoB4mT18NuwUI7mZXxNoAWgNC0b7Uj6acWkbXjLezH0KJVVDqzGq1YpGy8Woqda2
	 QVP6MzHpMzB31Q3dEEGOe6mltjgtvQ1aVy11CjVJyFUvqcyHW0OWxl1zf4VJUGTXpjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pXX75GaXTMr1qGEscquEidPOCC4V+kXbyCqTlbWwNJM=;
	b=PQs4iP1PhJTM2EzgFRC5i+daEDKldJnrqOjie3IZQJCyLTC/MNIu2O6/dM5cz3sO2d6k
	 JheyCouOBSTGlDOoKa2dScKe0HBMOPYAE710LrvThZY2IPMl8pcCN+UmLC4dCvWpCZEMy
	 xqCswUeNUE6xdCABTvYMKOrQS+6LvjirbLukKlf8qm6i1HSsKT4tZEGxGz6JEqCHOSO/B
	 xupCoB3UlHD1XRDzs+A5cwwvtORPc2KEM1qAcH6IAJtdl0kKYbexqT4pNi4rVPNyAFAY1
	 IO/+ZbPbrR1Ax4bW6SItYxGKJAxTg1rvdfXqDJrUZyxMgeDkrx95RBDeoY+8fRzqhjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=EOo6CdTD;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420C3606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 420C3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=EOo6CdTD
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eaf169fe3dso482520e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793219825; x=1793824625; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pXX75GaXTMr1qGEscquEidPOCC4V+kXbyCqTlbWwNJM=;
        b=EOo6CdTDNZUpChXfxEDljEqH4BHQcYLAieNp0ah7yEn4oUXvcC24nmaVAiwb82JiBm
         MS9p7RNsQ/Yau2L+HiebwbdNeFGcSeWtjxQSQrKEXXUZLzQBLrwrBmZ7gkprByDUrwDA
         O5lORsL1LBmM5aKlh9Z1Tz9yxOe2n0MJn4bLykArrCCNf+7Ld5UgrypzciYkhPU4TMxJ
         Vfyu20n7gPm+7yUfNBQAdv/Kp20TS4URauCeEtO9122o3RK1V/Q4WQIgzMeynzleXkyO
         5MxIt/I6QkCl0ZiEf4af4nog/5Oj0dd6LE3Xo12kjcou4bZDTu5wV7UvgIFguTGqydVu
         t7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219825; x=1793824625;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXX75GaXTMr1qGEscquEidPOCC4V+kXbyCqTlbWwNJM=;
        b=VauFINXONGALOLLOKXzNyg1Jmt7TcZlmKBHuFxOWJ3yA0IAcTu/nhIh3QRe7u5fpZ5
         GypNUhe+15TyyVnszXpBonEkw4pq/8HMFkCb529GCoFuKD2qCXFzb6CODR9qMrgXMvja
         00+Xw9f3IXSZ9M0m41RnrY7ERdI59Z7fDb2QiTaubDnbh0qN7eNG655WRJhlXundaMhD
         Hl+Lu+/FhUU+w1FoL5VpiaS1Pj0wxJnmppHiCByv3IIkWNsvGwKJ9FXPMunk5cnBMJXI
         QMNCJIhocOaK2VRx5mo9DIN+EiH/y8CldLjblqc6zsPLtpEdgjjN1AVXgehCUjQyvj0H
         qGFw==
X-Forwarded-Encrypted: i=1; AKwUvByi4XMsXdRVqr7JaTb2VORD2afDT868YgN6haIL9T8HeMY/NzSto+n+FOEl/p/T0RqJ0CCWk66PeuaGvk8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqfaML6UrnZGMyHhGPHFNInCJxwS6mb4YCLIuYvMixqdR1QgsF
	2uLj3uwFG+Hmvbno+aoIvI0Cp8aoLkmXa18J+CtiB9U8JMMgls4kbBovoiLrKwXZ/4c=
X-Gm-Gg: AYBFou00KWWAqgDal5a35jCv05KemiD0Tz+c2MOVNyWb7pxhdlOVBvLwKmRuugTGWUG
	lWwn5V3Xf8N6E80xulOVjbNXsv7IRsKNzTp5NhFygMruVEdnUMiZsreD4wVD1mnD2LuBTOAJUJG
	4xlPnNoNEy+BBtTzggePA1qWq2JUBGlDVlZSC1BoNAeaJ9CiXkAVcH9sRaY6KsGuIMSMV4uwmuV
	S2pmu61krD3HgfbgDkG9rc1Lkwdg/ND68zcMzW4RcUg50tqSvp0qyTh4tzQU0L3Hh7Bae1aSNwp
	aIxwI+Y5fLx52AnkjNRROJhJiVsOBAVip56heugnReNNyFlpqNxfARAFzs5XY1UrAzNoWrrHsyz
	wIV1xx2ppztZ67qsFvYO3fX4R5ohjWzbB2r1Q6V0kkEOYzsMzhPd5mkBoGtOC1jChxYEGj9jBDM
	1uFp6xO9Gg60IIUi1RZUnimpXywu+bzyFbe+OpMXQudTZX3jczC7h6FKakIHoWEf2ApsePfp50r
	G5stpbacBnjobB0nqmGJlK8OPAravRHMFpY6VSYniEGv9QbkhRaeHWKgPCsHANHE6lqfp06luI1
	5PchFgC2+psTjzYB9+m+kbwnsN4ZQKH6rS0srwaxY7eyoO+dkDr/EDK1VIO4dN9F2tF1mc6c1ca
	rkfe7VnuYGL4aSbvaHVIhu+CNQlj23JhHBzKieWk0PY8ievVEau8RrFn83eCXgb4FKg==
X-Received: by 2002:a05:6122:d17:b0:5dc:d0cb:7d74 with SMTP id 71dfb90a1353d-5ec4caa66c5mr1844102e0c.2.1793219825199;
        Wed, 28 Oct 2026 13:37:05 -0700 (PDT)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f931911sm3001789e0c.10.2026.10.28.13.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:37:04 -0700 (PDT)
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
Subject: Re: [PATCH v2 05/10] liveupdate: Don't WARN if tracking a
 retrieved file fails
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Christian Brauner <brauner@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
In-Reply-To: <20261022225035.377445-6-dmatlack@google.com>
References: <20261022225035.377445-1-dmatlack@google.com>
 <20261022225035.377445-6-dmatlack@google.com>
Date: Wed, 28 Oct 2026 16:36:59 -0400
Message-Id: <179321981903.1894369.6363169044837754945.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=856;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=9m6WB2manDNmHNkWWaupqwLfpyUxuStC4em+E8XaZ0M=;
 b=kA0DAAoBu3coTNtzet4ByyZiAGriXO2ivBwzasr17tc21/VkmA5BpaNy5weddLAF0Xq+WI3XQ
 IkCMwQAAQoAHRYhBEExqpPstG8a8H82Yrt3KEzbc3reBQJq4lztAAoJELt3KEzbc3rePOYP/2jt
 cPdYHQOGemXNJXRL59xPkeLyW7o1RN8hKWIyLuuP6Ug2pE2KyooLVMtwE8WNXTanREsAnV4iWbp
 18DhLZiTVBE5EkM6/8QNoxAZkBSDn4wK+ams5b+mlNPwywvyaEBEZ5fKKScmaNRUCAewpICwMLl
 6MMU6jooZU3sPMbiNKXJ4N2gI/L88JDIsa8rjkt77+VOWxdfj7cWe04yETLsWkQM10Hks9z7s9X
 ZOWlM1lzsqqXduBkm7t8oYWd3s3WaFw0ZhWD3Jv1SpMGSr1ClSSLecw81Ivne6/TsksTGXzubO7
 calTT+OWXI6Ax7nJh7l9RnbbkISeFgCF1AvY+QBFDjjZWEJTG7Nr0os9xXrFOrGET7jEoXdiT7C
 jarfhSDZOjpTla4/QTgYy5aknwkd6vMf+cTDxSZr0ncV/ztL67ng/SAo+XY2X+LJh8NaLiSyawU
 kESqNdn9F8zlYnkqd76MqKhhnynb2Kl39nk67LtMiZ67kERKg2TIvDyk4/+htE8bVfSCyWrbbza
 9rmcRPjKqVYqc0R782X+ScurAwX9FCOEeZ1pGnyfxpn+KWMPQHz5KhiszhkuX1NuJ3nRTt8rwYp
 TeWhBbAFasJNbFxFUn3xnNwQ/MPrJYtpe1iwAqpgdB5suJ6Wk564LOw8NLWPTuZy1U3/0vj/x6P
 YsuVI
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Thu, 22 Oct 2026 22:50:30 +0000, David Matlack <dmatlack@google.com> wrote:
> Handle a failure to add a retrieved file to luo_preserved_files instead
> of triggering a WARN_ON(). xa_insert() can fail with -ENOMEM, and
> userspace can trigger that with LIVEUPDATE_SESSION_RETRIEVE_FD, so
> warning about it lets userspace crash systems with panic_on_warn.
> 
> The handler has already consumed the preserved state when this happens,
> so make the failure permanent. Keep the file until the file set is
> finished, like any other retrieved file, so that its resources are not
> released before then. Finishing the file set then erases the file from
> luo_preserved_files, which does nothing for a file that was never added.
> 
> [...]

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
