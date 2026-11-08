Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175893;
	b=u9j/9XdGkawAckgeI842A7my61LtF1LNzr59PVUwiOTjTzFZ20Zp8wb11BzSwRLgqu6M
	 ZugnUh7ZA5vy7GgXhwc070sfWx2mGzWvOML+h7xj2y/P4BkDFpcwgYlaYixBDvKcDBsU9
	 41clL5rHvqMoG42jh/Wq8rv0MMUI8a1sg3A7//y2OljSvzyKnZfloGjTVj+QUiGbMa5c7
	 I+ofcqeg3HS+IAhhruE55rNkk0pzHuqx+cSdcC0mLFzDM6bGoWBUPi/GY4qqfX81HhxP3
	 l1DO1wR8iS2LfFseZ61s3H/TkJ55wx4DstFTR76rigC+dT4Z2n8Fm7L1nDwOYm0dgig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AtwP5j20gn7E2EyXET3bhOC0Urzo30JN8vyaQdZ3DMA=;
	b=wXKlumnur/WDt3XPDmeEsCHak/uoyM8fwAcCYDW2gctirj5QYMcTQ5rQrTGj2I5TtetQ
	 IEasrrAaAia53QmuYwrZpL2qTBBmONajSGlzyBnW70TJfAPzsbh/Q3ehQX6IagOTJHVMM
	 DkvoiKux6sgmFRsu8wDN2IICfOdFlKFOQ0/tG4l383WyS2Gp2DfDf5XE4nu+grEwRr8kR
	 wdUYgKDCvbEUAlvvZqnF8FMFbxAJ3D9MrtIPXbUHLPM368A/VZkqNUF9r7zUacbtcLuc7
	 519wK8zr4agD1oryBRwb/XysFUYOw6HqyK8r2IQswa2354B0YtvA/tCFwXGgIDNyunw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R/lRsW7o";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEE5606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAEE5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R/lRsW7o
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso474499c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175892; x=1794780692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtwP5j20gn7E2EyXET3bhOC0Urzo30JN8vyaQdZ3DMA=;
        b=R/lRsW7oCKLF+VFs4SbeM7nISXevZJc7zyUGcAWotAPalydatcKCAA3DjG5H3msv+M
         ZgDytWBst86rTrwPJ6wA9+1akDnJyjBvPwXajXtBVxOdmj2ljA63IjNggzLlyeriidG/
         Ya41xCiPQLdQ9h9lev7MtWbg7xLGBUHGTAfWLSr6VP52Cl8LjJEsBXBmOQW/cK5e98na
         qsYJn0kCNWf4wdnPNcc2ShRzNsI5Cr/oIORH6Lg8TE7xzirzVMMj9vpqjoXVOmxl9jue
         1R8MqK22vQ42RorlKTFqU58xn4YxM1evQJTIc3/97ias3XQx3HsH90aRTJfANbT009sg
         /c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175892; x=1794780692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AtwP5j20gn7E2EyXET3bhOC0Urzo30JN8vyaQdZ3DMA=;
        b=HRRnUwhsuCxEwJ8p7/UBG/9IWVCEswLVPqO24gpl7ANijrRogd9mg1Sl03TLvQZoCE
         uLJCM1gtopOJjBPX+NhfZdY19cKj//ry8T2KHcf2anSsLQ8OrodljSVPYkf1hHhtQAlE
         mwvBs88LAvYVvlW/hVOzVgBgkQKx6smMcBtHSkKF5KSqmOYeMvgmGttL1ppQfVrXPQ4B
         uQMwGYXm/Z8Ibp/vqUKPPFo6yuHNTqwJOlDXWoDiL6gBenMDUA/vDBc+JYyHSGBEkeRI
         upOTrm6SOTUJCk0ngC6bKNoQ5vNTcIg8l9ZwJ+4UpAXBKt7dg6iJyz1G+CPGr8WXoJ9o
         zViw==
X-Forwarded-Encrypted: i=1; AL+hErHWjJemHpe++zvtppcBDkKwJtxJgCrFE1lODcmSFrLxH77/bq4Xi3zVerbbGEyXzpT07IXkzsMwSWR9mDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CqZuNS8KzMwAs6acp5vG0gYtLjBjTc7NaMF0XnlOSrQgq7iVR
	Y3sUKIJv+USg9JSXPne58aa11hr/Z1j2bistROMX/XXITm4UIcEgl9g3
X-Gm-Gg: AYBFou0uuVBXPXGWTo6/1V+en0fUbIa87xlfiAmXhDv+xu/MXIm9/6ngUxer89dkmdn
	DnMhLBZ2GB10v45u+VDkDo8pw2zpW0Ilb0VM+IZfstbNsSzzNXoG5uPrV5IuUmXghdUFVhsoIo3
	5KYs0AEMjLXpb3cB3HpBUOCnTAfnw3EyUHxBBirk10rDR20/7bzsSf0KWFDqmiALvoSH5kvXz2e
	BRmjBd46ZPNNh7QH/BOcbNQM5BvDtBhqt8icsG5G6ghhhdClmZ+Luiq9Ubgz1dRDzvx66ZvNjqn
	giPE54dnuvhgBKHq5zqh9K/DdsiQKV5/tZsq27NKY5odOTAevkkR+RGXlANIk99zmlz4+ZI93eR
	PCbCxTX95E/IeCZd9H53rl9F2o4CpKBYrpaxbHfD9TPbLP/jFZ7ZJGNbs0w9SXF799dkKD36HV6
	OL0aghA/tf5KhG6T7XzX0BxO3mPxEyd//j4c00yHQE8PGht8YQczUmXyf7SocRHZNCgv7dpWgB1
	AQT2GZwwWu4wVCk2JpbMfuql0ReHAkZCGFR/tKrophCmcl/cCMfdg/pOldPa9gGKnFGIA+7zI0D
	Szfb2snCfPYIFqs0MnHKgdfK7VvwhYKkPeQhyt9Fg6mZ5jjd5H5OOr1knquz4DqYPw==
X-Received: by 2002:a05:7022:b0c6:b0:183:e993:7901 with SMTP id a92af1059eb24-1b39fe9485dmr3817898c88.17.1794175891567;
        Sun, 08 Nov 2026 14:11:31 -0800 (PST)
Received: from anon-laptop ([103.187.196.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771f833esm7912691c88.21.2026.11.08.14.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:11:30 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: linkinjeon@kernel.org
Cc: hyc.lee@gmail.com,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ntfs: convert a named $DATA stream safely when making room in a record
Date: Mon,  9 Nov 2026 03:41:04 +0530
Message-ID: <20261108221104.1081384-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd9=crUmmGbO1vcPsdz-GmWoHxD_W_bRv2PQ_Db3Q+EkCQ@mail.gmail.com>
References: <CAKYAXd9=crUmmGbO1vcPsdz-GmWoHxD_W_bRv2PQ_Db3Q+EkCQ@mail.gmail.com>
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

Hi,

I went through Sashiko's review of v4. The WOF finding is right, and
checking the rest of its report turned up three more problems in the
same loop. I reproduced all four with a forced make-room pass and debug
delays; each fails on v4 and passes on v5, which I am sending as a
reply to this mail:

- WofCompressedData: the stream of a WOF file was converted, but
  ntfs_read_wof_chunk() reads a non-resident stream from the device, so
  the file read stale clusters until writeback (249 of 250 bytes wrong,
  correct after sync). v5 leaves the streams of a WOF file alone.

- An attribute converted in a file with no links left is evicted on the
  last iput() with its dirty folio, so an open file reads its extended
  attribute back as missing. This is older than my patch, the check
  covered only $DATA. v5 converts nothing in such a file.

- A resize of a stream or an EA converted the unnamed data of the file
  under a writer of that file (iomap_iter warnings, recursive
  mrec_lock), because only the resize of the unnamed data itself holds
  its i_rwsem. v5 converts the unnamed data only when it is the
  attribute being resized.

- The conversion of the attribute being resized waited for folio 0 with
  mrec_lock held and hangs against an mmap fault or a splice reader
  (hung task). I wrote in the mail to the v2 thread that this direct
  conversion is safe because the reader waits on i_rwsem first. That
  holds for read(), not for mmap and splice, so it was wrong. v5 uses
  FGP_NOWAIT there too. While such a reader is stuck on the lock the
  resize now fails with -ENOSPC instead of hanging, which I think is the
  better of the two, but tell me if you would rather handle it
  differently.

The six scenarios from the v4 mail still pass, and so does a WOF file
read before and after the conversion. I also ran a mutated-image fuzzer
(about 800 images, KASAN and lockdep) and the resident/non-resident
reader stress test on v5: no crash involves this code. Two things the
fuzzer hit exist without this patch as well, a WARN in iomap_iter() on
the read path of a crafted image and a lockdep report between extent_lock
and the mft runlist lock. I will look at those separately.

Thanks,
Wahid
