Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540572;
	b=h3HRBCikPcSn/qIa3oQwQNNrERAuQXESw+UIj9bHdNox05hk4gz3UcY1YuikKpl+A/nZ
	 ig2bRYX6v3MW+37SE84jVytWXw4s4OprP5LrmcitWUG+raVC8CjT/LrAEbZPvS356+lNg
	 lqith77LRBqtYGVcVn/mGoiRu1S+FnEMUJwZZLyXSvDDvPr55n5qeu4qaMeD9c8N5FB4k
	 k56CecqfF5fQq4m6NMofKuvd34bsLSefV9FVKf5uUcloVMZz1RaZBZaebuWiBRw8awski
	 2Sv8W/TifKizbG3Ht6HuTaDHr/1TjDp0BsphoNWhPNIVPnXTMlLTGskGimWHfjtqbqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OVVlwCCA1VOiytgWSOMQ1r/qQrP88cTuf93DDNf2J8A=;
	b=mw29/xGytg7VROEdawdldYNzZPYROpP7f8t2mk9UEIXSkIaSqbDW9vCNE95OMzGzLY73
	 mUvMMSfi5Wme1HvTA5u3KJigzHhTa7eza5G8JnPUQfyTVotDwIiDQFKo2jyZdQCr6bPtv
	 Ays5DvsJF12Z/O/0cO9dfQO0qu0iSWbmXz5TU4etACJuzATKx0U5ALJ73jvN3SzASSq4E
	 s3mOw1zqwGnIYmt0ByRhVKheC0pN/vlkDd+TzL1s20heYUw7KN8aH99aGNRpLo5bDj7Ni
	 9Mn6dNmLf6oDfBRPpFlyibr839TQsa2NpoP5g1qBbh+14fy0purn4mXkk1XxXk4uXcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dN992MCG;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10223606A338
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10223606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dN992MCG
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae58d17cd9so224406c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794540571; x=1795145371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVVlwCCA1VOiytgWSOMQ1r/qQrP88cTuf93DDNf2J8A=;
        b=dN992MCG+OvBpBDmgo7VA3dzlSfiCqdsX8Wz0ia9pyk9zl7LjHHjgH16i5B2AS0qp5
         D4nK6dWWeFty+EXIAwto526zG3r5hekQvLPEa/jQDC5XxT1flZlJ9/0M2mJOboiNajE2
         TvCubp1dOR54H/1gjHeTyIm3gnYWXM2HIM57q+WRtibxC4J2Fc5OR64XYjsS/nrmcY7i
         hRblAnpA/Wq1SvVGWBdvkUn6asRKkwejOeUcDHFqskEkRJCQm1bRPicbOPEi9kHoCGYH
         nxg0Yw1MAsLD1bG/MftNfH0BdknaD0Y+VZQ0gZTfYyWTwKg2GkYbydggBuuFkX4z1U75
         NAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540571; x=1795145371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVVlwCCA1VOiytgWSOMQ1r/qQrP88cTuf93DDNf2J8A=;
        b=MlSspUygaM59dgoKiVn/GlefuS/LMRkOvwJTNMJ8kkevqK9QW8Oz1M7qjttkdPDiRC
         vJbfiWFu6jf+7Wn6DEGln715f/+IBHiDXnqq1Kbn0qcIeS9rNohL8P+sb4HTWZB2cYca
         t1Wi9dcCbLeFXjuNRvZsrJlDODMzhmTSygNFovueTyj+6KJbThzJXa86/CY6wWEcbo6n
         Cl0XZWNM4jL6jTql0H4Pd8xxOkcIosS1nV/4NERNEcx9ENKq5aM48zzUJlLTM/4fqSyN
         vPsqqfaZZCCtuaV/y8pK8RXfQ5rinx4ASq5X1PtOL4Q7QNVrGE4TFDjemXNQIxr9M7Hs
         0M0A==
X-Forwarded-Encrypted: i=1; AL+hErFwyTe3bL4Y62mlUohEXCwU0V0Q9RleQl+tLecuHIKweasvrO5X08KeJlstoVodMhJvVed6QD6hubDXcWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aOMT9/EWnL8hbJZZJpypi4A0EIlavzSG5M4Bbw+EgA1ycenNx
	2Ow3aNG3gzfTZJhEbSJRUUaE9HpPA2qt0Nw8Syq2HPCd604uGhKIS9uo
X-Gm-Gg: AYBFou1674WBxDkyA79eQINbT6b47n9q6v9OZcjP7D7RwnNIvauI1KbU1tb3fd41boi
	69Boq3s/hfPeVdLl5ruKqm/KHwR9ufBd5Vc8yfyfPablyMK4mG7AdYSigSTzOMkHeNeNJ040ENh
	2wlgR7syySPCqWKQwlesp3d7h5BFqD6gfr3UCkWKOMu2OErC1Zrjd01vebusE0KTkI39yIqcoMI
	pORiI98R+n2c+JD7nMvMSea7bAS7NIgvp8kVZzXWr6TPi2RtwnoDeTXayuzd0D7EvsgYibN70Nt
	xlZbh/4xcFiUDzcCrIhe3dbXfFC3vJaTwHDJuP/Enp6sYi72kPYHYDewaKg6wIX3C137eoNe0o8
	sNkNurreU9/359IfdWdn5VSFZL8JMs/WB0E4HaY/X20RaesABC01yFpFZKzLsBx19GbAu67I9O3
	J4hWCktl2CDxp4tAIVDxbD1wpuhM8wBNRhiiDeMJyaamaV1Gr+o1ZaZqbIyOcNZTeYoyk/ux6EE
	bkV3kUV1SpmolMYdXjAtt3r9pXgF7KwDKSUEAib/4wS24nViJn65WWMt2rYxF1LzsI8hQYzOlxf
	MpdCsD/9MXjzNm0M/h+G
X-Received: by 2002:a05:701b:4188:10b0:154:fa0b:6df1 with SMTP id a92af1059eb24-1b5030fb7f2mr1410187c88.37.1794540570881;
        Thu, 12 Nov 2026 19:29:30 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm3029718c88.2.2026.11.12.19.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:29:30 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v10 0/1] perf jevents: Check the keys of the JSON tables
Date: Fri, 13 Nov 2026 03:29:26 +0000
Message-ID: <20261113032927.634183-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112222526.462146-1-takano32@gmail.com>
References: <20261112222526.462146-1-takano32@gmail.com>
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

v10, and an apology for v9.  The two fixes v9 describes were not in the
diff it carried: the commit that holds them was made on another branch and
the series was built without it, so v9 was v8 again with a new cover.  The
review was right about both, and this time the code is in the patch.

  - --check on a directory that is not there used to report nothing and
    exit 0, because nothing found under it reads the same as a tree with
    no bad key.  It now says so on stderr and exits 2, which is the code
    the test already uses for "could not run".
  - "--check=DIR" is taken as well as "--check DIR".  The option is read
    before the parser looks at the three positional arguments, so the
    value could be left over and taken for the table directory.

The check itself is unchanged: walk, set difference against the list of 51
keys, print the file that carries the bad key, exit 1.  On today's tree it
reports 19 keys in four tables:

  arch/arm64/ampere/ampereonex/mmu.json    PublicDescrition   16 objects
  arch/x86/amdzen4/cache.json              BriefDescript6ion   1 object
  arch/x86/amdzen5/load-store.json         BriefDescript6ion   1 object
  arch/x86/amdzen6/load-store.json         BriefDescript6ion   1 object

The point about the test checking a temporary table and never the tables
in the tree is right, and it is still not possible to add: the tree
carries the two misspellings above, and a test that fails the day it lands
is not one anyone wants.  Once the patches that fix them are in, the test
can run against the tree as well - I would rather add that as a second
step than bake a list of known-bad files into the test now.

Changes since v9 (and since v8, which is what v9 carried):

  - --check reports a directory that is not there instead of passing it
  - "--check=DIR" is accepted as well as "--check DIR"

TAKANO Mitsuhiro (1):
  perf jevents: Check the keys of the JSON tables

 tools/perf/pmu-events/jevents.py        | 48 +++++++++++++++++++++++++
 tools/perf/tests/shell/jevents_check.sh | 36 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100755 tools/perf/tests/shell/jevents_check.sh


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

