Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160004;
	b=YzZ7/h5wb2XM69fQ8TDcmE9KTUck3/hJwSFU/Dz/XHmH8ffQgNhMyzlXz53u5XdJFroq
	 u/NYep3/TlecpP5G3dLlFZ68fdmoNS70JwvIPJR7Z5QGSz5+SPFOhikyNc2bsacAI8P61
	 pi4/qUk2hMxWmnNpEjHzdlzBYFVLKQaSk2w6f+aUv7GlPUgoXQ5M9zbgdzjH00MvRYLmC
	 59mUpwloEc/IA+A2qclHt66EF3TsEYMIy/x/FdN6XkSVQT3kNZ8xfLdVDaMvQg0Kj8mK6
	 QgKuyTlVPTqw50BwFcGn+livZlKB1xp9V8vVWMFdpNaYOeJfdjZh2UETH9M38c6lXZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9PnQ2xaZr3mufSI+K6dKdlREXH8U5SwjpmTIIDKwMRc=;
	b=EGEOCoWoTJzrN3/Ql36yfDKb+I5DyJac9Eyf9L3W7kPDpL2eg4uSAm7xW9GoG9IpND4k
	 goEYDxO2WZ+x2uZF53vtG9fSgMm3kUU6KjkCxCSbM7QGVrLN3KL8BX1ITkJeMHytgxi8y
	 ngTosU1Bo3AH3ZdXFJ54a+ZrKezJApT/J/NXA1chnJfWZc+W50N/tKCbLoT5NTAiHT098
	 85aLpF/XcHjlhINrMMj28BvpVGThHt3UOND+Ymq1vczRw+Dxx0gU9bwL7ZFy0aNNTwtHV
	 D7ZurHuPCJ+LJt77L3w/zIfqN90aX2jlhYwy8eFmyKTOYZaay4r9KTbpla9qWeP7T2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBFB606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEBFB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91c75267b0fso8408176d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1793159998; x=1793764798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9PnQ2xaZr3mufSI+K6dKdlREXH8U5SwjpmTIIDKwMRc=;
        b=Rx4wB/LhE02EKCirrNsMf/bIC/Ktzo7u3dwF+S3HlsfNKW3SPrW2onMGaHbLVMuF2p
         4AH0RuZkBkR7r/pDtqMhDUw3WMcpMR3dsbSuiWFkU0TALoGcxaf3VMIToOZA+szp5Tlo
         J7UitxxoUAiQGw5jIZ1jWLRG/fNUCVXwtfQx42QZH5jpPmIV3Vd1OKa8LUp7alfhsq8M
         JK5jCeuAYLAtjaSYyPe0lPSbUj7Hl2R0PurD6aLtQX0w5cOEiVUUD9BS5RMuE92CT4cy
         xPJdYgbky6NRWJ0i4Lrl0B/7Bus4+THeU+YgMcjp3eHhVipME+Z/i6RTlxi28j9X43Vb
         X+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159998; x=1793764798;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PnQ2xaZr3mufSI+K6dKdlREXH8U5SwjpmTIIDKwMRc=;
        b=QR7g2YfXs+j7glLPY6qIUy+pAsHPjS0WxICyHmJYx0e8wKaFPB0GGfnma3STTIhUMH
         Eotf+OzpSEGYUkBp2nyFssKFa56J2STyo9WMY8D59BrKjDpBFNgNbC1MN13wjljMHRsb
         GaXQbIFimfrOlUhsgKa163kOwzj9saMduCVU5XL/rHWgLiXywk9Rxe8fLVoFy+xA7ZM9
         TcS/pDdbAGgxlkcBwETzlQvQDOMwtz3CJdxq311nXZwjDXpoSBV11IPVY53lxYOuViW/
         bWPqy0X/pw4NVoG+5IUcueeM8gLjTg62/0d3Xa1Z+iIyC7HPILhBi4szoDqnPC+bYuPc
         VdBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk0QMIIohVWZcVoYqiP/a+7GHjJuFv4pwqYVp4OVWv8740hWROgrmHM++XUeJFUZnH7OS44DkshZ7BfFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKElzeaVhGUuQWj+GC3176gCqlyFTdf6DB0xKTm9hVG47Fqvqaj
	p9N2ryWJd5UfHAGBvDfD5snsN7+pK66hvK02H8jHXv/5gH+qma1qabLgrARViR4Z+Q==
X-Gm-Gg: AYBFou1oxRhJnmu3nlZZsbR+NEnOTh7naNh9pl8TFck9DYmBctP88ND9T8WOPWTkV4k
	aoTHqfvZBp1JnBtELVOUIsLm6uZm9nu40HCibVTPBmuJoinM3xmvo38Hk20zpIwCj0pk6Qmsdby
	Jk+G1SThayINoR/GEDbrTtPNDqc2zVwiTWhbGXN8LYBxhRgdNdvliXJ4wjPOYRuLbhg3qY8/qrl
	opU+1Zx1oF9jWsRMXSKiY89MBtAs6sv5BscK9x8JV4LrTdJ09+Z7d7oDj0i3b9arklhTdaJFeLf
	D5a/WWlfHdXFZ2WWHuPhhpSdUWiLGa9TmKwSkSNjCuX1y2xFBeP+a0ZqTQjxKSvp9/m40obI2pE
	+lM9mKWT9hJByMGZh7/pYpSDmhaJ3RWT5Ioj+irCh/kxbzC9/ICgqWsVGobIoCkuGeNkDtLd/Cf
	aJM1RADoBvXe9d8+F/IfpsNuQrtsor4LgoeHTZe5Ud3Z8xe17XkfBBuoD9KxQl4PEMfIWyXatNC
	dWThh+bUfcR/1+x900EwWfr/jAy/ndIpW5vkkyy0v+zl8eknsr9u8dQTVOvCOsPGbu/ipZ8LEpR
	XHArX3gLmJ2NLUObmUV740/pqD/jQ+7NI05k1RNzdNDj5cSB410e
X-Received: by 2002:a05:6214:3201:b0:91c:7549:f377 with SMTP id 6a1803df08f44-91c7cf9035cmr18524006d6.29.1793159997516;
        Tue, 27 Oct 2026 20:59:57 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47cd9dcesm119808666d6.42.2026.10.27.20.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:59:57 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: slava@dubeyko.com
Cc: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hfs: avoid reusing occupied CNIDs after deletion
Date: Tue, 27 Oct 2026 23:59:19 -0400
Message-ID: <20261028035919.733823-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e2ee251e8ad47c6f1e2faf9ed1be787eccf5215c.camel@dubeyko.com>
References: <20261015110114.1649059-1-hengyul@cs.unc.edu> <b6f1cb66778d09015ad5862ff273edc37c44ef28.camel@dubeyko.com> <20261021153141.311425-1-hengyul@cs.unc.edu> <1797b66dee80c9553748d4a961470894c917bf5f.camel@dubeyko.com> <20261022120658.1328124-1-hengyul@cs.unc.edu> <cd6cc32dd2aae90b88b4c3d19e1fb35a5be6f4ac.camel@dubeyko.com> <20261023173259.3275078-1-hengyul@cs.unc.edu> <e2ee251e8ad47c6f1e2faf9ed1be787eccf5215c.camel@dubeyko.com>
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

Hi Slava,

On Mon, 2026-10-26 at 10:20 -0700, Viacheslav Dubeyko wrote:
> I am not suggesting to change the on-disk format. All modifications
> should be in-core metadata structures only.

Sorry, I misread that.

> The algorithm only solution will be inefficient and it can hide bugs,
> anyway.

The table below is about efficiency. On bugs: in both variants below,
a lookup or walk error leaves next_id unchanged, so it can only stay
too high, never fall onto a CNID in use. Which bugs did you have in
mind?

> I am thinking about adding to the struct hfs_bnode (b-tree node) a
> special field: u32 max_cnid. [...] What do you think? Does it make
> sense for you?

Yes, it makes sense, and it works. I wrote a prototype (max_cnid
rebuilt when a node is read, raised on insert, rescanned on remove and
after a split) and compared it with the unmount walk I suggested last
time. Deleting 8000 files in KVM on v7.3 (KASAN):

                                unpatched  max_cnid  unmount walk
    newest first                14 s       7.0 s     0.4 s
    odd ones, then even ones
    newest first                4.1 s      3.0 s     0.2 s

Both are correct: no duplicate CNID in any run, including the
threadless case from my last mail.

> If you believe that this approach will not work, please, explain your
> vision of solution in details.

The unmount walk, on a delete:
(1) do nothing unless cnid == next_id - 1 (your step (1));
(2) if cnid - 1 has a thread, set next_id = cnid;
(3) otherwise keep next_id, which is still above all CNIDs in use, and
    set a flag.
At unmount, if the flag is set, hfs_mdb_close() walks the leaf nodes
once and writes max + 1 to drNxtCNID. The walk cannot run in sync_fs:
hfs_new_inode() takes a CNID before the catalog records are inserted,
so a walk there could miss that CNID and lower next_id onto it.

Your max_cnid
  Pros:
  - next_id was exact after every delete in every run, so drNxtCNID
    on disk is right even after a crash or remount ro.
  - Nothing to do at unmount.
  Cons:
  - A delete of next_id - 1 still visits every leaf node (about 3000
    here); the per-node max only saves parsing their records.
    Checking the thread of cnid - 1 first brings the first row to
    0.4 s, but not the second.
  - max_cnid must stay right on insert, remove, split and node read
    (hooks in bnode.c and brec.c). A missed update would let next_id
    fall onto a CNID in use.

Unmount walk
  Pros:
  - A delete never walks the catalog; the one walk at unmount costs
    17 ms here (cold cache).
  - Only catalog.c and mdb.c change, not the b-tree code.
  Cons:
  - next_id is not lowered during a mount: after deleting all 8000
    files oldest first, the next file gets CNID 8016, not 16.
  - After a crash or remount ro the high value stays on disk. In my
    8000-file crash test drNxtCNID stayed at 8015 on the empty volume,
    more than 4096 above the largest CNID, and fsck.hfs -fn asked for
    a minor MDB repair.

Which do you prefer? I can turn either into the next version.

Thanks,
Hengyu
