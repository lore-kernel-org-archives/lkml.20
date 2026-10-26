Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040807;
	b=mpVEWReUdTuWgR0y0vf7rA8qdwj7sgMN2loSFAUcG72XPoKgSBaZBgxOJP3JcYHNp2tA
	 0f06deb5xBWBUCxNWw7AjcoJOYAMBZI+1e0EUrkUY9I36tA5DjHNMbVFlrnFeNnpXWoK6
	 yBqOZNau79SxlTikcSJM55zdOgE6/SvgpjEIuAxokUeVmQcL4sIfC+RavNwEP+e+gBwvh
	 stSxtWMGnyvPP3TdiEtoyhG3OhvJNi3t6upH/zRXvW2RNRWm2Fzu/+1O8Z+lN+xjXRsZ+
	 5rxczAlgqqiIZXvGPO0xgOvICKOiuZBYSnHpEIUN0Ne5dWPoUW1bHr/fcnR2urEPutw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=o5NLvHyayaKTthbgjkTC6jcIWBDJBQQe45RTaipv8Ko=;
	b=AWH36WeUmzpIqlrNdwxaOvFIBKKOjP+W/ThMtW4eTvn4XnNLuUv4fdRcheuzY/hQx/LY
	 ew+ZZ1pRpoTIwdmPtv60LfYH1YsUlwDv/RiswV2LHsGU4XJVjYBYfte3ehZWUDNfPPVOK
	 CJRmz4bEBtQLB6Fjq5yS7wTGzlrNjXVKDKxTl5zQMkbvrzQXmPy34jEd+O4SQb3M2C93K
	 A3FgVFMMz1B4WDU2/XbxTRbx1plYYu2VAh1RibrcVKWONBlUsJBonCEKsloixXGZdCx+i
	 6TKx1n0jVa1Te9Frge6oFrb7Ypf3jNt9e5NEetqws+2/nGBcpwGZcMF24+W/BTyv6cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=CkPB79dh;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A70606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1A70606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=CkPB79dh
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so5710976a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793040804; x=1793645604; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5NLvHyayaKTthbgjkTC6jcIWBDJBQQe45RTaipv8Ko=;
        b=CkPB79dhLiahZ8JZrPpo4pq4pxCofDlikv0q0hXBVUr50atzel2LT2/DQQ9D6yTV/1
         9H2BoPCwDVp3nCdEg4y8LO2kwfUqakvQglmxGvcLqvFDp6YxwcU6lMDDKSMDhALeK/Ju
         I3SOW8yUp+vyuTCJdTjpv73YwE3QqQSOWzrK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040804; x=1793645604;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o5NLvHyayaKTthbgjkTC6jcIWBDJBQQe45RTaipv8Ko=;
        b=xkWjAgvY8pQN8VRQS1WODBkeU5kcaQkee7xgKxU1n0ea/VO/Q/tVgkIFpgZfVOyFqj
         3jDc9ePfwopknlWm3v38x1ao6JixkqmvvnKqyI7yr99ncdY++6/8SkrdN5cRBZGhQnwp
         paFnoCPgAGly+2Operi6vy+WH8cyJkHoIpejsnhtMJ5RKtXjUGhL2pGzJvBVw0HLAJeI
         DiJ8aMGVh1fO4xiDxc1BvwJRxi+J8NyeSK5itCj7ehXUWBq9wypVZYsvi+4rtNQ3EHRz
         1ra3OhImEX1D7yLqBr8Mmh1W2n/7WJD+tu3Cg/8OkbRxk4MUYLbDNTF8ZCXNhEJoNqQ5
         H8Ag==
X-Forwarded-Encrypted: i=1; AKwUvBwYSuUE6o1voITbcum5jDKkQs7po5CapORpz1OzCgFUpYAa2ufOWYg+fbpWUh38S6HlOHDdqVLmNJ9njzM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk5HaBgEAuqWSyRxeJhMDWvSR8/CR16xslLGMN/YYu5/+0Jes7
	+zXa7iTGjLSkRxsVhcXuxUqpB91SNIgsw6uycT4Sd86BpqvsEf4q3kPphxDncR53tJkFQUUpG96
	51nPULfE=
X-Gm-Gg: AYBFou2/SwMk1Oi0I55rXciBa0D2CnMVPXZLFfZAlGawsFGj135cm/DsMJwp7LSpF2e
	Xq/dh6m9uKRjC/RrNFWEgYK+jZsbaA2YcI9WRIpfm5Sw0vksFyTTN3GSSnwNNGfkMMUSXAJO696
	6Fo+Wqxzuh3GskkL09WdMwp3rSkD8va4eLnvbS12bo2vhcfWBCPRtwLzi9Qk5jAGT2Z5wcfwsT7
	M45CSmswj3EEjw5XGJO/RagVspvoqg/pQw/+I1u2H61hgChceJTbkAuhBMlVKfyONzrcYS9p678
	hUsBqpIKnX/RXWtUGBCAM0b0H7nzI2aaVWvtDyYaxVKOBTVAgNfV5pBqCSJ1Nu85ogrbHIU+bBs
	IkkN5ethY5Vce8Gk/6zjALYSkKkdPbrZ7LUdvqNfxNzCHl2lI0MXzheGzMeh+kZB+ZBbjgyCtkl
	rlcIoRQuDokgxmlI0I1CbyNBs971R5UpdSVHand4YQXa5FO4PcXdDQfl/wyTKGr6qp2fzOMwB0q
	PbZAWr78Qg34XBh245lTRhgIPVXZiQUB5e2Stue8winz4M2yYqCSkeMhIa+dSLjIhIiXEjYeSc0
	9R2AbblDSCppGJtVp6s4XRGXgn2VOw==
X-Received: by 2002:a17:907:3f8d:b0:c41:4964:90b6 with SMTP id a640c23a62f3a-c46bdeba15cmr846813766b.36.1793040804304;
        Mon, 26 Oct 2026 11:53:24 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e99a2sm350960466b.24.2026.10.26.11.53.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:53:24 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so5796957a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:53:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3UPkHnpCfGotetMBl3I9UWKmFfnZv+D873vdAoa2QNuG1PhK99JbMivqihRaDRNyiBhKuXmVs/RNevUE=@vger.kernel.org
X-Received: by 2002:a17:906:9c86:b0:c40:dfec:50c6 with SMTP id
 a640c23a62f3a-c46bde12b55mr849392166b.21.1793040803209; Mon, 26 Oct 2026
 11:53:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024185058.20410953@foz.lan> <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
 <at-a-2wTtf7bJQwU@kekkonen.localdomain>
In-Reply-To: <at-a-2wTtf7bJQwU@kekkonen.localdomain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Oct 2026 08:53:07 -1000
X-Gmail-Original-Message-ID: <CAHk-=wiVxA+1x-eNCp3-e4=emCKXUw9HnSg-ng5A_Ndf6-3mxA@mail.gmail.com>
X-Gm-Features: AclHuK_noOhKvajafCF6Y4vLLjiCQi1lIip37NTkzc_fA8PG6fPCuM1fAW3-Gms
Message-ID: <CAHk-=wiVxA+1x-eNCp3-e4=emCKXUw9HnSg-ng5A_Ndf6-3mxA@mail.gmail.com>
Subject: Re: [GIT PULL for v7.4] media updates
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hans@jjverkuil.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 08:25, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> The patch in question puts camera sensors and related chips in line with
> how the rest of the drivers are selected elsewhere.

.. and other places could probably be improved too, I agree.

But this made things *worse*. Much worse.

The thing is, at least hide them behind some "embedded camera options"
that in turn is hidden behind "EXPERT" or something like that.

Don't make *normal* people who build their own kernels have to see or know.

Let's say that you have a laptop or something that actually uses one
of these sensors for a webcam, then it STILL does not help to ask a
user

 "Do you want a driver for the Analog Devices ADV7170 video encoder"

Because (a) that chip legacy and likely not in any laptop anyway and
(b) even if it was, no laptop user is going to *know* that.

See what I'm saying? You literally make things worse. Don't do that.
You're making the kernel Kconfig script ask insane questions. They are
insane because you cannot reasonably expect people to actually know
the answer to the questions.

In other words: don't ask questions that you know the user cannot answer.

There was a REASON why those menus were hidden.

                  Linus
