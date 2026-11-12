Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469286;
	b=QbtHateU/tOGluFaFAikqpwz3iyPeZo9bif9rhM+/KJn8ujiUeHEknOPm95azO/Cwc0i
	 fs4UMY4jUFRyYH78ItgKbDq2fGr9hxixel/CwpE/ZdZs/kPQB1EMu9623k5GPQFfwiQGm
	 ALWN2hQuRDNfx+wHU644jvS7HkbkxSF3kuOcLEy5yRBcwUm4CCrz+WNxnBm47B1PRpQcZ
	 xzpER39NBeCwDSaoRzT4hKwpNV03pG1Q9pCpq/XjScP/H/xel51erKWcfWKu49xBiAt85
	 wPXE5NJt2PPVAWjyk07UOpKWBJughrODHcSGuCuqTU4KMGXvUzl/DdfHPQBrfD06dlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bj8oIOvi/lnWkTPHPdsw8/wbnTz5MyWHkyXyWXbRMxc=;
	b=sh5fLtMBtSkUVKYPuCNJcTa4BoKJs2+dyuememFIDd95UEnWuWDErgJ5SvtRr/SZ8tjr
	 OCaMFgGEzuZY66n9YGIlz7puLZWT7hsGcs/DaADX52QTknh938mh0zW4n1TWRVakKb3t/
	 vcmpJe7HceqYwO2xRjWpTRXacbQwI7NFMSuIP1ZmOhx315hGRNu0VTPvdwKSwbqt+Bj5O
	 BiMr16xjRsbIkavoqmja02gLKWfyZMh3fripx41oatYB6sNsStD/9Y9SzNcBeqflW820p
	 lNsG6bz7a7/A8Qx4f3DlWqVRkSuDkq8qFkU7lPNQGdKWODQ5iPYWtW5Xuy7VeSNO56w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixO1nhek;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EA4606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82EA4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixO1nhek
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37000e7234bso3754082eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794469286; x=1795074086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bj8oIOvi/lnWkTPHPdsw8/wbnTz5MyWHkyXyWXbRMxc=;
        b=ixO1nhekxxalDWG1zHEJb0jw0LoiXRRtkCZWQtv7VflFG+Cib6Wh1X74S0IJjB3zx8
         Np4eNPgIUE+eioJwZQlGWpo/iiRjTQz/8EYuFQraeRzjVaApRPFku3F+vzl35LKFPKJi
         GpxGzM0aLgpIBhIeGxorOTSaNwv34fXIeU9pjlrLr//YxyFFSIZubaC0lFF2jdN+wqk/
         3SAKHwoIvuRt+VN+3IhadgJ2b+iQicFYyDXRnfNa6ZhQfMmZv25YJ3qyMnJbrVs0UkVk
         DuH97m49qr9h0DNUpUhBJmT/ZHvJO+gaVYOo7eCOa02f5mw5WIYE+BckK7AQa5lGF3mt
         pBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469286; x=1795074086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bj8oIOvi/lnWkTPHPdsw8/wbnTz5MyWHkyXyWXbRMxc=;
        b=gh9hUqDLgRjXe6egoqq7teCt95wNv1YM9KXFnRt0mT0wclYIjgQ3ehQwwi6X7pRVTM
         rnLdnzek3kem8fSOGj9ZWe+DL8edislgE//pl9zqv9qbaWgzZuL6HJXdWt5D2J4sS9z7
         zSbP8jS/RdNmCAR4JxFVDcZMe7qMTeT+C7H0VHMQ+MBvmFu1N9nxhqXgBF9ZaEMt6M+/
         FYZ5ZGz+ntfJzyW8cFlClvE8MCwCJduAJ5S6i82TY2abJ8cxAFzIPqhMlipte8/RVKz8
         HDnBLHkQlaTq4tON/eRoc8frxs7ddfJoYnVRFQmZribGIxI+Le3qXZeAmV2v/SwPnqQC
         UqFA==
X-Forwarded-Encrypted: i=1; AL+hErE6IHRPqqeHq82hUmAEWqfxpngPQISf07CADD2QCFa0M1sOAT8fN4nqb/ClvWq7IKQgAAZa0SgjndvtX1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EjxEzneg4ZwjbTnul4sIuzZbejo+k0iUrlFhjtLnYl067JRaS
	lszDZ14bOL5hLTiNj72fLYnMH1pZqiDoVyD65SQ0E+q7OT9yuCbl0e2t
X-Gm-Gg: AYBFou0hmaBh+UUue53H5Jxdf9cuHnuGizC53YXTsnnhEA5LU8+61CKfmiXf00BUyTn
	oX347bCg8lKSsJD/FKXe49jAYKdwvk4lkBerxLsh9+MSGVhaCSTeVimMiuHvcugajrtvEpcO7tz
	w+ozAlT9RiVYsFwD2qwQW0uy2UQMnWrtnHb/PdDLyTomlG1QS08+t+J9ZV+nelLqZ0LOoKYTiqA
	Pat9wh7+4vSObFTNWM3qUEZb/4HaHQQ38o8kosg6p4as6c0EGIcoDbilqmYOemsotb+2fn+vs/Y
	BPZulKLLCAHsHw9LJ+o4jzU93mImW3ZF4tPVBWUSgtKwxOi8ino62pOV4zCtVcPMsLT5hgbvdaa
	JjmWhZ4tt78gT4txBkAGUuZFbxS8Tuoj52PD3INsUj7BRq07NbrFC1qqNgX1Kra7DZfmKcNid+J
	Ao4/fb8/EPvL6j76Df2DZtM5oCjBKiLR7RH4J6h8rDxYf6S0zyf/CNxxD1Yd3tq057VbhrJzZ9Z
	wL2VeisekbqeTYWt30HSP6HvrMXZLX3r4GjU6VsLklwIzTh/KV0kkUdNYz/zDK6lcsqLyeMjY9G
	6/tdzb4+MfbzPDTjr+wL8CaPOddrY2i93oNbWMQZuwmPhah03SSphm2D73tdEstpOQ==
X-Received: by 2002:a05:693c:2582:b0:378:314:4042 with SMTP id 5a478bee46e88-37803144bbdmr1486709eec.14.1794469285344;
        Wed, 11 Nov 2026 23:41:25 -0800 (PST)
Received: from anon-laptop ([103.187.196.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm25594848eec.25.2026.11.11.23.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:41:24 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: linkinjeon@kernel.org
Cc: hyc.lee@gmail.com,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] ntfs: convert a named $DATA stream safely when making room in a record
Date: Thu, 12 Nov 2026 13:10:55 +0530
Message-ID: <20261112074055.1876311-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd-n+zGBq4i7rfLyX+_Y6zEMLTCCqb2vAgcnmavqKxtiHA@mail.gmail.com>
References: <CAKYAXd-n+zGBq4i7rfLyX+_Y6zEMLTCCqb2vAgcnmavqKxtiHA@mail.gmail.com>
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

Hi Namjae,

-EAGAIN must not leave ntfs_resident_attr_resize(). The callers return
it as is, so a normal blocking write() or setxattr() would get EAGAIN
for a "would block" that never was, and index.c already uses -EAGAIN
internally as its "redo the insert" code (ntfs_ib_insert() ->
resplit), so a stray one from ntfs_attr_truncate() could be taken for
that.

-ENOSPC is what this function already returns when the attribute does
not fit and cannot be made non-resident, so callers already pass it up
as a normal error.
It is not exactly true here, it is a short lived "busy" and not a full
record, but there is no way to wait for folio 0 at that point without
the deadlock (the reader holds it and waits for mrec_lock), and no
errno fits better. I can use -EBUSY or add a comment saying so if you
prefer.

Thanks,
Wahid
