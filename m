Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616364;
	b=V1AR+Ifv+6s2DIdnm9YnvzfibCDMDmlaErW2JpNuDidyxTID6+Af7ckZ7PHHR6VL6tTq
	 rC/YXx7cd5N0VJvjSTsUcgvMgo7sKJH0/aeZ6EvjOzkQXI1FKhwTmZaJ49UkuE5ZBDfRd
	 gmuDvgWEWmpRyH9xJoJ9LVqKUsq835b5Lr+CtaWx0EWyXPg/jdI2jrHPwi4W0uRb0G8Q3
	 FtDlLHAiqzQU64n/nuYkOaSnGG1+veK70z3LvKqtnkyg5iv+vSWwo55i8GXN8a5xKYuaB
	 5Na49aoR7oaVvEbBptQptJxEEr3XvLJVEZCcuOuKTH7wfp3tzWq7Fc9ahM+pIZ7aRYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=sc3hIjuqm2HqdSWjRIWRDLuVUuAq4OcILp/mjVvlhDk=;
	b=GZhW9DOjqV9yMLqmyml2GsaPV0xRJLr1B7VYVCSA1KapnCgVOBYEjtqRwOund/P7IpQn
	 8VewLChGywR5hUuXgBRArdu2Bf1IeJA8Z7RRnHg5XuPQWFFgmZXwAYb8V+lSfsDINffV+
	 BpvlSolyT9Rnm12G9xUD4tjerMtvg5Q5fhr6cG0+7d24+4h00fWlEYKBtGcpqREMhFIW/
	 /pCNmU28UEB4UkI2X1s+Fu1ZrIWlsA4mbOUhNXmk5ezqEdWFLUwRlWimrRe2eqeXhc6ed
	 JQk3Qop3D1o+e3rPEs9MVOg0lmt3RwMtMClM7ln7ZJBoHMhGfAoHrACD75qgdJDbDBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nhuhuan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZMNsh3Jh;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934EE606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 934EE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nhuhuan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZMNsh3Jh
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so2904023eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792616358; x=1793221158; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sc3hIjuqm2HqdSWjRIWRDLuVUuAq4OcILp/mjVvlhDk=;
        b=ZMNsh3JhlJhhgQmcGS+0lnv4PQ1jkXPwj/Swdqa5ZVbur6eSeM3Fa8DjhDGsrQASA9
         9thPSUOrzIJiFKz8HmF36RGFQfzfjXxadMsGq8wo4+TCNxiib64SG2G6HqHbWOpVjLAS
         EsYouMOnfhfHiQGbZ65Q7zFHBKhHyvGA4LiGHuACdF1/D0hwrdeBt4EZqImdHIQuer8W
         3eZfDmFhEaAoiEe0vD3o2frHLu1Bh+MwtXLR2sbNmu5cntokFsetboebwJZVWMtI65AZ
         /xtfEoB7lBErngBGxt7g3ScYFih1k75BH/8Q26w9DM1IJPr3K/ZsJG6uaqoKkllZ87S+
         yxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616358; x=1793221158;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sc3hIjuqm2HqdSWjRIWRDLuVUuAq4OcILp/mjVvlhDk=;
        b=cAiB+RCfmiRPpjzkMDC0KZ34vBSobsusb8DMXShyROuPn6H9ARfPynvHt+nenuXfqt
         0CR27WfGn6ewNYPNAKmlBRBFs22cLRR2ah2F3XhHznXiz26STZtbnPNsYcO5wrpnu/1o
         s0u/eWBJVwqEp55ETSomiXUmRR823whKdsOeRImcSesLE9PN80WSxzeI5t4NpXF7dSAo
         26wLcBFKcZOl1KJngMPkPHNYI/3qFoIVKrIdf1E/ofPt2xjaCPAZ559GUtBoHwWXBNE0
         VJ/OuUUD0TWHQ40ht67MxiKtZ/cNlxqmXMr7XesHUBzr4u25QlTmXtXItNw+qaGyBQW+
         tJVA==
X-Forwarded-Encrypted: i=1; AKwUvBwsmv+lIxelKZvdEegS9d0ivYrAMFWOk81BgYf6ycYqIFumiMfSVH4yO5KgB0axVBpohWffY8Hb37lhP8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYotm2pjtInJZIP9affz7DtpxvIXP6Ers5LCdEhq5subjxpvZQ
	wKZUlk4hylPwNLa6db4iy791/bvhcKamn+Hqy/7QLLceT80WWzWACUw19VJW4TuAJjO9p67yAop
	ZG1+SAR+CMQ==
X-Received: from dlbdx6.prod.google.com ([2002:a05:7022:e06:b0:16c:bd18:1ee2])
 (user=nhuhuan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a8b:b0:143:72b1:9004
 with SMTP id a92af1059eb24-190a87a3b70mr4075424c88.45.1792616357026; Wed, 21
 Oct 2026 13:59:17 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:59:16 -0700
In-Reply-To: <7e998cd5-57e0-432b-a8e0-676a5b773436@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <7e998cd5-57e0-432b-a8e0-676a5b773436@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021205916.584370-1-nhuhuan@google.com>
Subject: Re: Path forward for Virtualized Swap?
From: Huan Nguyen <nhuhuan@google.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, cgroups@vger.kernel.org, 
	chengming.zhou@linux.dev, chrisl@kernel.org, corbet@lwn.net, 
	gourry@gourry.net, hannes@cmpxchg.org, haowenchao22@gmail.com, 
	hughd@google.com, joshua.hahnjy@gmail.com, kernel-team@meta.com, 
	kunwu.chan@linux.dev, liam@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	mhocko@kernel.org, mkoutny@suse.com, muchun.song@linux.dev, nphamcs@gmail.com, 
	qi.zheng@linux.dev, riel@surriel.com, roman.gushchin@linux.dev, 
	rppt@kernel.org, ryncsn@gmail.com, shakeel.butt@linux.dev, 
	shikemeng@huaweicloud.com, skhan@linuxfoundation.org, surenb@google.com, 
	tj@kernel.org, vbabka@kernel.org, weixugc@google.com, yosry@kernel.org, 
	youngjun.park@lge.com, yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"

Hi David,

I'd like to join this discussion as well.
Could you please loop me in on the meeting invite?

Best,
Huan
