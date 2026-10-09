Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1267B3EDE6C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791524399; cv=none; b=FfxAJK/6+p8UUP7E58VN11rvCRr0Om3JDLRSYM5XfNcEjbn1AJRUth/AzSza8HoMK5m+fIBFygAWkzJd9roSPju5jt2opnIltoavcpb5BwnQgB2fh3xbCEU/28unYf7buDi/JGakuvA+O0/kmZ4gebr71TG2B4MV11HNbQFW/y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791524399; c=relaxed/simple;
	bh=+C3cHbNsomd6RYHV2leUz9PmRIt9GWQW8XPR1zddbC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m1tYH86miKUqqHPnl5+ujyHu+oBT7FkYz2uy34UQfFXPtPB5g5C/F1jJZB25UcHhzOjncw8IVNkJtRRKMf366w8OYSOYJIZofqqASZFJhdLLKegpDYGEoBahzu/GD1oMwee2JC7aEO0UJqXwmGdGPUdcWPsMAM58svn7YwrRsZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=peq0V2s5; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="peq0V2s5"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e812e2b31bso8655105ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791524397; x=1792129197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eV75knIz8MqpcmByph/prlZc4FrjYSgYZQ1PpGGXuRs=;
        b=peq0V2s5mW0i5AIdFX64cviFI9moKVD5n+FFn3+2a47asYsuKaOn76waN6jcWC6sB0
         xWtRdzlqIj568L5drK7QYxd9sbITgpUByTV9MzSlYFTHH3G98amne1i/sfuMnnSrIVDf
         liXYjgurC5pQvrcvf+D5ZEmWAvcNCkqOnbwYHaZULsdU6dYruwdmU6jt007r8Vpt5bkM
         NcWqKG+OEO5JJW/r+g5WGiIS3x9FZoSEvNwU78zwhvWS6aWlpftXLQoEH+pjVEcozUwR
         f6VKFLf4r1tnxHb2S193uPBF2iIue2y5p+L8fcAHaInjkEbBHsDESVoCvbZbv5JkdfyG
         HknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791524397; x=1792129197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eV75knIz8MqpcmByph/prlZc4FrjYSgYZQ1PpGGXuRs=;
        b=o1GI55BoUPNvNo0Ue8X3+lZDK1EZBQ1CB/ZwtBs7/+lhQFUT5STV//KfYusKxpdtZP
         xpAGFD+RY44jc7uUci2nNexRzWktHk/eAuXbZ3HEMr38GFUQRJNkwsySWX7IkeXDtu4r
         srihop3/VXE7ig+w023NNSN0P6aniUQF9z1A+nvH4qzufpS8N5ZPqpBKotFhy4F0oIc2
         /d601GlV4QA0Dcax7CkOu+FMRqJQARk1BTNX/sG2ADJDp8LIeirvzSCz/efvLNjApicI
         kz4xe0qRIa0FM9w+XBKHa1UbwWSFPC7M2ISi25XBc/2/kbU6es5ucNzI8tKASSJ8DxCJ
         bwbw==
X-Forwarded-Encrypted: i=1; AKwUvBysGoYyn5boOH7RVoeBp/QTaoGdIq0bm8v1lTARwXs5YafkxZkmB3fZ3EUeDye+KB84c8dQaCiwVQRLuLg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxV12OZFhJF1MSdnbz+Puxbfj1uihtOjzxrFZEouX0+WE0xRp5
	SGAuNGj8NczUxqeXF0VRRTjRC/a0rAmLqNGJAQ5f1ESA2V40AjQxOWKV
X-Gm-Gg: AYBFou0nSXKOsvUrTfgPknOUN5EiuRSAZO4EE6y4HAcnMeDQn4ankKME07Ahd7w9V42
	56vRm9FnoyxPwjr5v7+cwF01gz57zfUXCrF0lneFZ16QXYvUWMoLuQqg7ubOC8Sb6BBJJXhHlbF
	TuP0fkAaZFGy/DW8I5mBLd17nRJN4pHcVKwutqACJnKjeNEPvF+ZAvJtQEUZ4zSNx7T7rUznZiy
	jkttML3wUEZ0C7MwQSXloBZoeporrySnIRsRywLpybdeIyiWsjtffwTZkaUgbtcahTHPHwFPfSw
	DJYzYWDWccOmdJSZ4iJY44d+aaMuulHS88YXd8CTh5BngjbP//eaR66fHW9XZYGXAG1EpEKIrpb
	Ex5aKtqloCWvShYZn03R1saPHz+2OOt5Pi0v9OmZRxK62DEDX1o1kYKoO3xH3KAO3QpQHogquuI
	4LIQZKMwo9va5YqcSQc4v0Lxf0nYs7Wp+pCv4PROpxpicQm2Kpr+vRAWseAY2IJO0=
X-Received: by 2002:a17:903:32ca:b0:2e8:480:2bac with SMTP id d9443c01a7336-2e842bc1398mr6838005ad.25.1791524397317;
        Thu, 08 Oct 2026 22:39:57 -0700 (PDT)
Received: from dev ([163.43.243.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8e11sm3741575ad.57.2026.10.08.22.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 22:39:54 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stefano.salsano@uniroma2.it
Subject: Re: [PATCH net-next 1/2] seg6: skip the route refcount in seg6_lookup_any_nexthop()
Date: Fri,  9 Oct 2026 14:39:49 +0900
Message-ID: <20261009053832.seg6-lookup-noref-v1-reply-dac23740@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261009024341.687e7226cd6abca80e779fda@uniroma2.it>
References: <20261005-seg6-lookup-noref-v1-0-092e84774e80@gmail.com> <20261005-seg6-lookup-noref-v1-1-092e84774e80@gmail.com> <20261009024341.687e7226cd6abca80e779fda@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

On Fri, Oct 09, 2026 at 02:43:41AM +0200, Andrea Mayer wrote:
> One possibility would be to split it into two functions, conceptually
> similar to ip6_route_output_flags() and ip6_route_output_flags_noref(): a
> noref primitive for the callers in the seg6local input path, and a
> refcounted wrapper around the primitive, which bpf_push_seg6_encap() would
> call. The split would put the contract in the name and fix the
> use-after-free above.

Thanks for reproducing it with KASAN.  I agree, and v2 will do that
split: seg6_lookup_nexthop() will still attach a refcounted dst to the
skb for filter.c, and only the seg6local input actions will use the
noref variant.  The lifetime of the dst from the exported helper then
does not change, so its declarations need no update.  The commit
message of patch 1/2 will also drop the claim that every caller runs
in the receive path.

pw-bot: cr
