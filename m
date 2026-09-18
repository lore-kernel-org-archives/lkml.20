Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EACE3CA4BB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700443; cv=none; b=U9Y3MhKav1GFMH37p8gTEqkvYzIBiaFA9MYBo6eT8CnuiRckv7jLb1X20i5s2KME367TvUfTKC4SQZImsae//RC6ii4nv1XxQtNADo7d4Q4H9oR9waSUuYsaBwB+UgT1ZU1zAODGubcIfZkHZR+4c1nAIn1qxFiEClt5onMOFxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700443; c=relaxed/simple;
	bh=GHQTKoIXhNNoU3fdktsqcQzosZ5PZu724WYv5roiu7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8wDwXmNrXo5cDab53cNeOmV5GDzt1Xqw3ktiLoouvk11vlDx62sjNPUzWHChBYdnR4S+T11jMICpXPMqwimxJMs+Gvq9UvJAVoEdwselIC3vKaryOTjlbckOVRlwEyV7NSk8yZWPi449c6KVRKIRBAYSTsy6NHPBFdesiH19n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tmv5QcA2; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tmv5QcA2"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so208047a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700438; x=1790305238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GHQTKoIXhNNoU3fdktsqcQzosZ5PZu724WYv5roiu7c=;
        b=Tmv5QcA2fRRqTwkOvvS1wR+3kQN3Lcsmtfhg+hFrepPp5YdM5Xi6lLwRgwaM/TOqnJ
         iy9yjHLyWL3oZ66Ac5hXMnG/URCAM++YDBs9rXEE3llrGArEiMbI9zc2DFUJa0+38ixZ
         X5hVyT92SlKigDO9qo5STIo49GjepcdDE0Njtss5Vjs4tRPqHO7amAnUhIfLrEjwQ14w
         3qjkJaRCMIAzjuwN54pvQBEBSmvmFz/C/BY4bW/jqXSnl8Drq+vl6oX2PWKdGT07vnA8
         o4bcLuxxjmFtxe27xc4po2e6accp7AjsI56jJgx4ndagYr+ixmB1h96Bl8jh1SYeiQy8
         n7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700438; x=1790305238;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHQTKoIXhNNoU3fdktsqcQzosZ5PZu724WYv5roiu7c=;
        b=yYNaCLOyXqc8yWNEOt2wNVF+DdaxkmBsDq/u+vn7cDsGIxUCMcvr9WqyayFJS0C6qL
         Jow8jF3sMBJlJPPuLWEnhL8PwmYuZW0EOAqFg4j7x9V3lique4K2bVZRPcquhks412Bu
         zI0hx4o7XjFXlLQhI3S1rgQzJ8s7UOLbSL35WKgBLJvCY+qsYsSQe1pwZ0SvJQzVZrX9
         MN+p3E3iRCJL57Ry7vK9WOnguk+/9GooTVKzrn5cCswgRCl+EeN3kRina1NaqgkU8aSh
         Ex+2DtzcicTHrf1nidKc1ErqJBGNdFSfUckMux/jZO4aOJnw1YRFh1mNXOUUUBTmzkXU
         4bnw==
X-Forwarded-Encrypted: i=1; AKwUvBxi2wjJ7c4mK7QWZ7IvKZ6iT9a/nN1LXkaUrhbsIG6z1iomxUBdXB/9mNk5QirRpM4EK6z6yaoogggAqdc=@vger.kernel.org
X-Gm-Message-State: AFuF++kCX2J5E3xF3665yObdwJj+5sVs2a1+yLouthfbk/h4jfEagQ/1
	l+5XAyJmy3BcgmPcaPQdPViiaRi8xU2KX5tZvnTTZt5R8cbw3ChdICHP
X-Gm-Gg: AYBFou34ovtfZGwDB2BVa1oKcxg1nnZnf/7iheEpADxGIJp7MhpQB9gv4M4ArfHUnDS
	EA/+GC4UbAKKGm08Sgi+42uDFqbSQWxFzG8m+kr6LEhREYs8bskrlWbfZt35mRcpxPwRT9MLMgi
	NpUZmPvmDSVAuVgGL8Xzz0UADKLw8g2HoqsGqapnqvwCeUujzD5f7uKKH6UB+wkJld44My2vFFs
	j3AlkkFmxw0LYUldcq2Cgnp3GLF83hE19BpbBQwEZyw3ZEuoTws2U3Z0+Gc4a0s8QBBIXBPZYei
	R8gm/14fBosO8sggXMW0z5gvtuizwvtX9UrYN9YW1NxdbXeL6SgpqM3yLGD2RGV73kaYCG8GhU/
	kHgg8j28+vjgzMQy7cmupmgvhYnuzQCLK7/SqbNt3RMUCGDO61H0hK/2CI+lx5w2KWj/SmPkJTJ
	W6CGHKvnYNqxULru7P7VFlu9nxmoMYfutyUzpLy1sYYR93XeAmu5u7iRLOfOx4vH7J
X-Received: by 2002:a05:6a20:4386:b0:3da:f969:b077 with SMTP id adf61e73a8af0-3dd8c425bdbmr2587035637.11.1789700437925;
        Thu, 17 Sep 2026 20:00:37 -0700 (PDT)
Received: from dev ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50cb2e6sm120905a12.24.2026.09.17.20.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:00:37 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Yuya Kusakabe <yuya.kusakabe@gmail.com>,
	Justin Iurman <justin.iurman@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stefano.salsano@uniroma2.it
Subject: Re: [PATCH net] seg6: keep room for the mac header when growing the headroom
Date: Fri, 18 Sep 2026 12:00:26 +0900
Message-ID: <20260918120026.1205447-1-yuya.kusakabe@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260917182826.452d987261004173916e9722@uniroma2.it>
References: <20260917-seg6-maclen-headroom-v1-1-02ccec50f096@gmail.com> <fd0ffc06-f1c5-42d6-ae16-b592208c6d69@gmail.com> <20260917182826.452d987261004173916e9722@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 18:28:26 +0200 Andrea Mayer <andrea.mayer@uniroma2.it> wrote:
> I would fix dst_dev_overhead() itself rather than patching every
> caller individually, that covers all callers at once and protects
> any future user of the helper.

Agreed, I will send a v3 with it and a Suggested-by.

v2 crossed with your mail and still patches the callers; please ignore
it.
