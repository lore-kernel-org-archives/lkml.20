Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB125867DA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654626; cv=none; b=H1gOQBnkMb9CcEXOHYvBYzPB7ihysSvGhritVhtSd+RP3reOiho6ScK/8kHRGrfKt1ybVyMKvrag7o6ias/OLwQZIKt5XzvB9EUsu9iuhMIUk8iKiX5XTrk9HkUU7NveA01h+70VAl2zLrOBiyFxH8FzC2MuT8mnEeXhd9M0gzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654626; c=relaxed/simple;
	bh=wiqEuG8/cSEg7rIA1EdKPkNp8t3X+jIVQg7jtFMc8mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNosk5Oc9BlAy86ApuCUSV/1lwiuJw/0d5MMNIDQMuylnF854GlCCssJGLSnqWWF5CoQ/4nmR7dQqVUIsZbHHeMsaSgakWSgL0O/BC+Qpbf4yh6O8j/vdq87KFhdbFT/GlKxxg2/PfQBIDuwd2s5nRH23YqnZCUKBnoAI2FvYh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbGKCVue; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbGKCVue"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e82ea30faso1130515e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789654621; x=1790259421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wiqEuG8/cSEg7rIA1EdKPkNp8t3X+jIVQg7jtFMc8mo=;
        b=RbGKCVuedKx3vs+ffEOxw+sZWVVvWTA7OP75LquQFFL+FEBiifD9GNUIId0gSfsk9R
         JISEhGH1wDGCQiZrpfhRwL6Ipw7EUa0bP6rSrtiIrKIiKTGc+dkDmdH2/dRwdbCouWRJ
         9S4taRq3bMobOw3+PM2YAvW9G+R+A2Dwux9Ikis1PQELHiVz+vsZx1tbAy15G4iBEZ18
         xM3fyxcY6UysQRImFLIcCY/ocYwBxDhdgKFYSSKOEiz+Cu41DpsY+pZB2DwjQM1B+l+Y
         MAH1BLJdDnlvwlzL26yOIOvJwBbndubT+m4jWGDw1A8HBmemUAGwTn55lApvzfVqzDLh
         Xnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789654621; x=1790259421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wiqEuG8/cSEg7rIA1EdKPkNp8t3X+jIVQg7jtFMc8mo=;
        b=bdK0axiUGTrPl6MSNXa5Dg5vw915WdoB0/w8FL8/HQmghEPDt2hfz2sU1OkGm4xlGw
         wKb7p5d4pv5bDE+KVC9yXPqVzwLmz0Natv+uUx1NhTKh/y2w62Ekv3fHr6rT/Yxmbc0/
         cHCUOs0bC9CZYW0BCpZIPK3tFQlJ98nZwbuqOYwDshoFCi6yk2hmh3jX0ccahclb3iXn
         gjNRSpqJ9FyIDTIUO61xi90D8RQk+SjCIyUDHONGjUrwp8rN7w3vWCs2tpZVbsBYawQh
         wZ4BzrqbynUwotaUjMWl/5hyw5WStv0IdPNHQR/9iR0D5zb2HbR6QeNS+yh+ccy2CoZb
         d1rQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0vmg2FZU4Hc0TviLNCZ6ta5jUUk6UK31A8apRLnYwxYfNTOrzuLxchgG8LHahkXKevU3wYBL6LZOAPy0=@vger.kernel.org
X-Gm-Message-State: AFuF++lSdd4CPgQnTW+/KJcE1pAR96Cwzf4N/2n3u+0GH4KBfLN67pDV
	hppP8dNxT3QpmqaB9kcQ7orP/4lLFxo7gPqVxhuyxpuQHnsianjqr1xRjfZ415zH
X-Gm-Gg: AYBFou2DhZ3R8uDZFn6B0fkcVdbTFcH3rrVEh/yMSmosLmrMpxlo1xFVd/6HB5h5fvV
	r7E36f7fXyN16HbCwG28SveDrNeBrRMUCifRQsQrH0yWcqr+cNxZWmhf+HjIbfLSAcQ51eYMQzz
	KZix2rn3sL4z0NsNbg0rxjj9kI0dshghFXPconOEClj+WtUBihAGViaBCGfYeqh/n1uR0eeDPIt
	G1S4IZMy5b/vBF9a96gPQUqVkO+Nc8jzzRk0tmyi7G3qXX+HDM98E3PJmbJ0XT9vCu5PQe3AzGs
	q+OjaAB9py0WC3kTrSPrGIOluNpn9vMYj/RxxsrMGvfbgjcdfbuekBn0lQ3qAhYr7LObtUOxxJa
	3KbCI0gby0odD5JWnBuK2xgrrug6Z/bKSfHfEFQ7s1WMIrQqySMImIZgZwrROme+x5NbSi11ZlM
	cwOdT39896Gvoi6E34mpI7RQXSoMRrgn+j86gDvOCYqDMIokG5otmH8qKa8JnQp9C8Yw6FzrV9i
	WiPW8w/MkgEtjh5jmBccp4=
X-Received: by 2002:a05:600c:3492:b0:49e:7c8b:fdef with SMTP id 5b1f17b1804b1-49eb7329b2emr73332995e9.2.1789654621094;
        Thu, 17 Sep 2026 07:17:01 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd247809sm134648665e9.11.2026.09.17.07.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:17:00 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: christian.loehle@arm.com
Cc: beata.michalska@arm.com,
	cl@gentwo.org,
	daniel.lezcano@kernel.org,
	dietmar.eggemann@arm.com,
	elif.topuz@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	rafael@kernel.org,
	rostedt@goodmis.org,
	sh@gentwo.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH 2/2] sched/fair: Randomize equally shallow slow-path candidates
Date: Thu, 17 Sep 2026 17:16:57 +0300
Message-ID: <20260917141658.14490-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b129997a-8d49-41be-a93a-7e0343c952e3@arm.com>
References: <b129997a-8d49-41be-a93a-7e0343c952e3@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Actually about the last part, I'm leaning towards sticking with v1, because
> that is actually the current upstream behaviour. !idle CPUs currently trump
> any CPU seen so far, but preserve min_exit_latency, therefore sticking it
> into the shallowest seen reservoir is consistent IMO (although we can
> certainly debate if that should be the case).
> I'd prefer sending a follow-up with an idle helper and making a properly
> defined policy there, but that's adjacent to this patch.

Hello Christian,

I could send a patch about this if you want, after making sure about
everything, obviously.

I'm a bit sick, so if you say yes, I could be slow. But I don't think
it will take more than 3 days after your answer.

Thanks,
Kayra :>


