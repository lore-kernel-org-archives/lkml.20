Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956473;
	b=fJheZHIxawiS3X+LOAPoL94FL+vY459hNU94DDQDfPb+obcilUnhTbDBKVecvd/YYK1x
	 DVzRdvUFLWTHVSG2dVzHryv5Ek5WAGW2vW2oMe2js+IK4N5d16CoLzGZ7QmLL/2/8i0FA
	 AvnFTIkwgnplrp7+yh39OKnttEomrURzEPW2l2EfMgadFNJpox5pgnRk2kJpkF0zm6CSj
	 eFdtTjAtXERl+O4rUKK/m1OSfF3nMzZT1fs9SeOcOhFdv2ikCMVXRFRWcq16uybtqbAOL
	 p8nDu7R7YaWPZPZX+3EpM1/PupyPms547nTCXNUbSzfD+wFxhxgDdiNy1W6e2IWBqvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hYxjyPXBHKTCAiV1LvERXcwFBgtg5JptbqNlrk95z/U=;
	b=2mxJHNWM1KsDwTM6+dJu/ZIlGocM2snVRtYWMOENDONGLsKs72KoRKOxfCufm2B/TxRZ
	 lwh2V8spjcxn1E0TrkunWB7inMTw9/izxV/S6Q+GabNrUHR9TUD6uol8wVqxSchHbiM7G
	 J18R5HT7MxiTYtVLxwfO6Iny8iZXY/H/QN9o4w53CcrywI4nhBHk9RMuQU+K7MTciE2Of
	 uLAUGiw6TfdJnGkK1RyL0/Uz7IQC7on+rnUz7tVqH2YpvJO7VMSSLoiJOC0LpNZDfdtHq
	 cyQU9kJHTE9EAk3gntuC0qYJ6djCckU8KdF4vNqS39WYEziCAh2L8f8puKfXWJltRhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E45JGGGQ;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D32606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1D32606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E45JGGGQ
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a3c08d6928so772165c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956472; x=1794561272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hYxjyPXBHKTCAiV1LvERXcwFBgtg5JptbqNlrk95z/U=;
        b=E45JGGGQajMGTNP6Ld2aXqAex1Bp0z4/3WfJCGIeCkCkqYeHAPT2KEYuSXJb46X4hI
         PmZd6KN/KAj0NEMVL8KIVPA0zERygqfCT78iLY9tStNCqitsvYQaV8CYP7HZZdZCxON7
         +otIoJAybK/LghkuW+Zi0Bzakghw/H6iAUJvWjXZ7ggEVqDChT8uBokKdGvfYby4qzmD
         +x4Cs18jlSZ8vdUgRTrJmOPSKpeiP604r0Yajm1HuETnnK/F7dRwciVbwyLTcdXqxmY5
         Y0sXGDMTgqbHl1j/1dxJAuiY2jGZC1vwu1kldqinG8F1J5lnASCCtRwZNw1b0B0EkjAs
         tkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956472; x=1794561272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYxjyPXBHKTCAiV1LvERXcwFBgtg5JptbqNlrk95z/U=;
        b=PQ+l3f7Rcx3vJ73KW2bU4Fm34IqEzRD6/dblT4RrVqOwzpAuFVYS6OFqa48/fyia7i
         42G210HaRQbv4pnqa6/3k4TK+qrtB2SDSBf1fFwKGqg6uKMZLYshP21bc+veU3kc2VdM
         KRtT3a4e9lyyiAfXwVWKjxIcM2JPyKWm1400n1Nmh1dCJcP6TR1FyW4pRDbFREB7Kkve
         +zhxadnZI3mq/DphmBnauL607Yj0XpLkIOiMGnGAl4gsa4viO3oQFAlhvk43N7L5iR54
         UZljLAH+OP2+yN87BmjSfXx5/2aNP2we+CprJ95bxMjhvF0eG1XGICPQsFdVGv0Nuj1R
         /B/A==
X-Forwarded-Encrypted: i=1; AKwUvBwspy1hkZi2KK6lQdBFZA61Msx4RZpDTb16Gbv2H3ELEMiROwvC8bvo5zlcqJcBjeI6wl9wpQjy/ncy+EU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZsMOG0D64UziC1YIkG9pqHX7f3ra560rwAa7UlfCcUChZ6HcM
	gtsrQuCSDO2sviHg4btq9dqxN4AxoK9XcoZrWqUEKjfK94n9EPyGSFhQ
X-Gm-Gg: AYBFou19lqopanhAWnUkt504cPnbJ19OkgRSvcENVtaGsjIhaLUig/8ROgMep2aFLXL
	sblll7Ifk8uNb5azq8TojlMGrMSdLlPDTz/VOylwmSe+kuE6UF/O95L0YdpWuLYWNuSPirf5IcS
	xx64l6RZ5R1Nqf7M/7HsY6SKH4F5vJpraify6RL+2L5yOlg4eOP1uGpzbZh00PfZXA2VauHJbqA
	YCbb3YuxTmaUp7k4qRmrL7Qm+8qYGZsGZdHi7OoIxcS8toThUdTNL6uqqYfKUmZVE/sHqZbZHgZ
	B+/hgyL0siiWwC6xbbBuZZKl/L8hMbtU+GAOwO35UZmIcbAQ3apl1HVDZvkC4yFhGLCcBRRZeJW
	DuhDQxrkKiDgu3+zk5SHLcrpmDvoHW5SMl5koUvnKg+cSOqa0AymrcjODNv1pkaHlSgOyyJpJWK
	yyNqTtW5bxUN5gsUZlGuOUa5yjl9t7dLuKZF6rqSRvXahE4I3qh7A0DHLbFcQSicOBa7yQrP8mn
	oqLbPnN9UItXBQ2SuPdqs67WbxTJxNUhGk3GNWKQgKQS1n5ww+y+d7+9LnRVws/z6TCLImwz6OD
	gxpbXSjPRJQ6o9ZnVVJi2D4sPUyN8OfU/Q5f6X4hj/4yn1yS34d62INpPVguajmIZg==
X-Received: by 2002:a05:7022:1102:b0:14d:c7ae:85df with SMTP id a92af1059eb24-1b25d31ef97mr2084289c88.12.1793956471465;
        Fri, 06 Nov 2026 01:14:31 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm4200968c88.7.2026.11.06.01.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:14:30 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>
Subject: [PATCH 0/3] ntfs: three fixes for crafted images, found by fuzzing
Date: Fri,  6 Nov 2026 14:44:17 +0530
Message-ID: <20261106091420.2461683-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
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

I fuzz the new fs/ntfs driver with mutated images: an image from mkntfs
populated with ntfs-3g (directories, streams, sparse files, long names), a
few bytes changed, then mount, walk the tree and write, under KASAN.
Three problems from that are still present in ntfs-next (e62b384ca).
Each patch has its own trace and the reproduction steps.

1. ntfs: do not read an index block outside $INDEX_ALLOCATION
   A directory without a usable $INDEX_ALLOCATION hangs on its first
   lookup. The task waits for an mft record lock that it already holds.
   It needs one changed byte in a crafted image.

2. ntfs: open the index allocation before reading or writing an index block
   NULL pointer dereference in ntfs_ib_write() on link() when the lookup
   ended in the index root. This is not the path fixed by 9365c4a1357e.
   It needs one changed byte in a crafted image.

3. ntfs: open a named $DATA stream by name when making room in a record
   WARN_ON() in ntfs_attr_make_non_resident(). This one does not need a
   damaged volume: a file with an alternate data stream and a full mft
   record is enough.

All three need an image to be mounted, so a crafted image, not a remote
attacker. I can send the images (about 380 KB each, compressed) if they
are useful.


Wahid Khan (3):
  ntfs: do not read an index block outside $INDEX_ALLOCATION
  ntfs: open the index allocation before reading or writing an index
    block
  ntfs: open a named $DATA stream by name when making room in a record

 fs/ntfs/attrib.c |  2 +-
 fs/ntfs/dir.c    | 14 ++++++++++++++
 fs/ntfs/index.c  | 17 +++++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

-- 
2.53.0

