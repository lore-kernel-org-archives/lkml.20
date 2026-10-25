Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792889261;
	b=d9aJCnT611zIVPct1lQj6OhjVKbbOJaL+xdbmCVXWBABNTiLUdBbWRbJ9Uo+6QG/iL9S
	 FswBrWzbqjMIahkX26VZ5LoeoyFAnU052nAQQZY2vlFDaHkAmXTvdNYsGmfY8WX86Zk/e
	 7+Rhi2lHN8fwdlufqDXQps2X6SnmMUiprvUpuBOARK44lZNdzEC3kvoM3G4c3AH2k6h2S
	 aEKIGyzqlJEjLWQDJ2528ZR+JIvJV7SIIgRGCOIdljCd/WsOmMDBjQixfICWNlz2JOosH
	 C9VUWbzKmtKlN96FSjE1xyQPIuCWv+mmfmBySqY5u+lVLIGC84j3cxnZjEkGjuX7C7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792889261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nb0uRXvBK+EdWFyShmZhmAjJrdWNQ8t+bMXyHmnTsuI=;
	b=5XYjKgQhBGAQuS6UbxPIwhe697L2jw57rPTdt3go2q+6c24ngVv0PgXIpsIQksJvdvD9
	 hkw0NDj16QvWLu9S2He5niDcwBN1ilJliE7fPxFP9Uk3psMzE3ku8+SjcwfKydJRJTjoC
	 HIhwCjIBHe16BHg/QpJ25Ykz4otg6VmR3RKnBMnPqadT7fu+O4P2RL8O4ut6fFxU6SyHD
	 SLUierMvhTIN9DRmlz7cs0Z+pAbxf5SElxhXopq7dhiyV7zVCl5fHYBFe5faH8DxxomEo
	 wkuQARcYX8pjtUQjkNLrDxUklIbqFxhK086kDz+3AfwHEfvvnPaBKr/4e0/jNn7ybBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ugju8VLs;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC65606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AC65606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ugju8VLs
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-84a2bea315dso1252185a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792889260; x=1793494060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nb0uRXvBK+EdWFyShmZhmAjJrdWNQ8t+bMXyHmnTsuI=;
        b=Ugju8VLsoghX2a0iSLRFG7uUMs4aIizMAFRcj9/S35XnhLmFHlHG1xVsTtcqXsbCAu
         do4uWVhuYjo5Pb4U5wMy8WwqgnCF9uESVycAbbrMsh8RDJJ7rAmTXligNdu9uJAgw1xP
         epUcCCTEFjl3NpC8dvhri9b/dQOurV0oCuY6kM2FfBo60eI7koXMjGC5n1wBat13gXL7
         jP3vNWq0+FZiR5Yea+lYmmv7t+0N69Y1StKwBg7o1tpqP7DZz47BnCKl5yfpIw1VENjC
         txMojVOXr8+f4ZhaEN3AMwVG4y6Qxz6En1IfuHY9zvYXC4b2AvRETv8Gb8PrNHzeNBTI
         jR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792889260; x=1793494060;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nb0uRXvBK+EdWFyShmZhmAjJrdWNQ8t+bMXyHmnTsuI=;
        b=govDBK5H1FNDqU2SajL6j/brHUzanOL81v3D7w/Fnh91CD48QNGzbxNl5Tb8gMKv7r
         30BPBeArjZYU/cUpDJse/U9rQYaOJ/UgHw6Qj3Kk5q9WrgNDTt5OxZWvlovR17vN+dQ4
         zCnvp5oGsjUB50YV4SN534m17BZyh+PPnmKDrgquatwa3dAHfdpU7TGRKklNXFupPsjg
         rylwpGizWjJ5CEs1oY9bOW4ExZhsgC4aIEe5a3+AMvnCM9pgR6Xn22Hzfv0NRayL1cAy
         9TM6BTiJk5mj3e8c8IeqNEAT5Gyckxfr0vNP+QdBZQPMzu1d73ov23ngj5+4KQr6ZHN2
         9fGA==
X-Forwarded-Encrypted: i=1; AKwUvByt0VNeYnWujP8CxpFdcqPcPP8EbzsbDjZxZx6BtX4LQ5ihIvGuFG2XzdW+be1rfllEfDvxEp5kAXS7BOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYINkDV5kvKEs7TfZCs2GltUS71ZlA75dcEsJ8rCISt/c7tH4hg9
	dC0MAfNa0wNLqLr6GXWvfVstS+OQ0EDj/Nea2iILTWG1eVTyJ3Ip13al
X-Gm-Gg: AYBFou1CFiWJTFpuPvl3/PaaXuZbLE47cpsz+VywihvYQqeezJ9/uGDAiYPfutWkowU
	v5X733PSzt2CdrKy8w9kjiWv4hO4UfRUTXpyQDrWCIhhAtHrNWRALU8gSJh0f+z/5Qjs5NpmF3v
	aNTGGdxgeLPoHQS0GdJW4HrnnN6F6x3jNj0fLuKjUDi6NwfvBFKtN2P2TPQo7iXyUAUZ7ftZw/G
	x42m2nREO8Ej386PaJNqAdCsH+tP8qrB9c4NKUnCu6SpUoQrDM2lEmEZVIPGAC0Bp/mMmZl9zIo
	VPqmy077o62aGSKF/jGrH97uULRoxV7wFeRAvFJQShUeeIGwso5cVIbSHUapfWyTAQsw/Q+T+Yb
	/li9ldtNFIDIIJqjaalfbQXJDocxfvRhBmhw0SpIs07AEFw9S26cJdHY7YgwS/TCXEiwVa9RVgt
	gM/72WyxpZhFrT7wZG1ksD1jV/2f/xqc0jhF294UHXp7eZcN6ehM7dzxhg0rR6RME0r61A0Bm6K
	zf6rx+94Vr6/OcLxyWNyPrNC2AC/OvcHZepkpUwsgFmjH15B1dtiOA1NIgnabBaJ5SR9Q==
X-Received: by 2002:a05:6830:6411:b0:81c:4784:a5e2 with SMTP id 46e09a7af769-850fda4d496mr2567474a34.6.1792889260041;
        Sat, 24 Oct 2026 17:47:40 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fc002444sm3536258a34.23.2026.10.24.17.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 17:47:38 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: rostedt@goodmis.org
Cc: Leizhen Zhang <lzsx618@gmail.com>,
	nathan@kernel.org,
	nsc@kernel.org,
	ljs@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] elf-parse: validate what the host ELF tools read from the file
Date: Sat, 24 Oct 2026 19:47:23 -0500
Message-Id: <20261025004723.432708-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019085754.1fcadee6@gandalf.local.home>
References: <20261019085754.1fcadee6@gandalf.local.home>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 19 Oct 2026 08:57:54 -0400 Steven Rostedt <rostedt@goodmis.org> wrote:
> Definitely not a security threat here. If the object files are corrupted,
> then this is not where you should be detecting it. Unless we change the
> purpose of this tool as a corruption detector, this code *expects* the
> input to not be corrupt. The reasons for checking various ELF header info
> is if someone is porting this code to a new architecture where it doesn't
> support it yet, we want to warn.
>
> I'm fine with adding robustness, but not complexity for an issue that
> should never exist.

Understood, and thank you for being direct about it. You are right and I am
dropping most of this series.

To be clear about what I did and did not establish: every reproducer in the
series is a file I corrupted by hand, one field at a time. I never had a
legitimate object that triggers any of 2/5 through 5/5, and I should have
treated "I can only reach this by editing the file" as the answer rather
than as something for you to rule on. The cover letter asked you to review
the threat-model classification; your answer is that the classification is
not the interesting question, the premise is, and that is a fair correction.

So:

 - 2/5, 3/5, 4/5, 5/5: withdrawn. They buy nothing for a toolchain-produced
   object and, as you say, if the object is corrupt the build has already
   lost. I am not going to re-send them in another shape.

 - 1/5: I would like to keep this one, and I am sending a v2 that just
   deletes the comment you called useless. Not because of the fuzzer -- that
   one does not rest on a corrupt file at all. include/uapi/linux/elf.h
   declares

	#define ET_LOPROC 0xff00
	#define ET_HIPROC 0xffff

   so a well-formed processor-specific object, and anything in the
   0xfe00..0xfeff OS-specific range the spec reserves next to it, shifts by
   more than the width of int in

	if (!((1 << type) & types))

   The tools should and still do reject such a file; they just currently get
   there through undefined behaviour, and on a UBSan build that is a hard
   error rather than a clean "Invalid ELF type". That is a one-line fix with
   no added state and no new failure mode.

   If you would rather see even that as churn, say so and I will drop it too.

 - The separate sorttable and tracepoint-update patches are the same class of
   change as 2/5-5/5. I am withdrawing both; see the other mail for the
   tracepoint one.

On the "porting to a new architecture" purpose: that is useful to know and it
is not what I assumed the checks were for. It also explains why 1/5 is worth
keeping and the rest are not -- the type check is exactly the warn-on-port
path, and it should not be the thing that trips UBSan.

Sorry for the noise on the other four.
