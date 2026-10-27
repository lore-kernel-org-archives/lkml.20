Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140247;
	b=gmgHKYilbz6EsuIn9vD5RqlORO04Ml9vPUSDB2fawlQnin6RcGghWWovn+wNQ2MC0AMR
	 BIxsIuMDlZSIz4oJ1kdylas6zvgFBTte/tR5iHiyGp6PHY6D9n/LXWbrOxE6FNHx0001S
	 J5MM9tfxHGfVkFsXZzOZB9cl4EFXH/b/AbjbqC6hOQL7OWhMEVj6PCMnJ6cFTBgnDelEa
	 wzYjl1oIXlqnt+dcbAu+xhkK+cWKEA59dRlohslq/phqry9dXtB9v+4SRIRl3Sl0rHsnu
	 an746uaDAsTw3s7CUNJQ/JMyFHlJtIgBdHOEUeplf8gbcgaM6LWmbZFQ+nPHkZueZEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fF+hhLhhGF6DZRpl45mUYSu/W2Cwx5CQUq9wX62q4sI=;
	b=HFOPLsxoQwxcDbxPj0F+tq/vHJEJ0UvbM36wuxnYQkFEGrgQPzPTR35SedVNmQoUcsdy
	 Z1J37zhdNcK28u8aHgBDQT3XByxpQle5DK6548MvkrMZeovP/9dmurl39tCpUsB+prd4t
	 cmtrz5RuQBVVYhEFJFtH2Mecz9QRUUrhqZ7t85miXDlq8batuDx4DO4RVa44oQTw3Ykbg
	 c3maqKrcuXu6GgyUdf+xQEWun9jcDY3BMN1JtWUvU7kTmqyxOoeWQFBuDNhlCattVBc4A
	 IZJuJd1fj4up8GAlJXSGKUS0KRxrQK4aGDSIqhsPAwgCIKkskzWk5gdjSITeXwRFPvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Agd5xEZT;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99270606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99270606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Agd5xEZT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso381295e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140245; x=1793745045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fF+hhLhhGF6DZRpl45mUYSu/W2Cwx5CQUq9wX62q4sI=;
        b=Agd5xEZT0SCLP1Qs3rtzM5hQM03DW+I9YyR3vQholVVKQAzmv4kn/GqSShtv1eV9TM
         y/5YrRB7t5ltHaV16Yl8JYTMUGE9P5rM+ParoczrksWwBMDlYBn763TdRNBLxnWsD2TP
         xG8ahgSoS3n03qG/V7GjHLI0oba2FIP0bP/n0tJ+XUieAFOifJsTZyGboZQ4AIQMzrBo
         TByDoD6pgPcLdiY2i48LdeSS8L8nCEOW+xZVD9s0KWn/fKxQUBLros2x1UpPx1yM6vI/
         jq4G8LrWMoOkRxwHkq50Sn5uP5rtg+HQxCzx9b+HDaV79ZShdvf1AEDEDX4ILQZSbNKh
         5IDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140245; x=1793745045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fF+hhLhhGF6DZRpl45mUYSu/W2Cwx5CQUq9wX62q4sI=;
        b=slcFXdLCOwZA+ZvVOH2iSphvvYoamt36HYZtSOjaCtDrH0+i5ZMB2hL+shjO1L9HTg
         ykHo/XV7xKWwgh5RzyjzjovmnOlTwTtcMdX9srlKSeYBJ7EgiUfArdU7sNM8bmXLQsy6
         eTYGw6dAdaJxDL0blhvXTtV3Jz1OtKq33EV7ez0nL7sz2IR6SPP3OHpTiE4Xvi570hXM
         NtGyP3sduEYgNuw3XX7KQjzP/EpmoBhvDYxhJRJS8Tndik/yMmsUAHfSkrNdjRkLBkmc
         fZ33nwuGeNA1ER0I5oOSeWPbvAkVrqGlYjs9RJeNFAAKm+WntbE9dzpfbsKc36BGfkFl
         XfUw==
X-Gm-Message-State: AFq9FYK4TeIX+Hks4su+BZ4f6ecZpdOnWBEZIcGmCCcg21Om8zyChCYP
	EbWZFrtxvQ4ZKIzp/e3ui1GLmOeZQGBPLEXkCtkw6fZupvCxa7jk/9gy
X-Gm-Gg: AYBFou2vSi6jJM3nrSRUTQ8yRq6juRUtMfu1mYX70/6A9ZEsIeVyjrYDnYbhktkyRq5
	L1rNL0ibyyiseRk9CrtUm+ash73n6ulFjymArSODQb2mA1U+ww57VD5fzdymSA+Ajrow4GExSVq
	26Sb8n4dkqD6SlYHqM3ODhU2MxZZ0564fe0DjYHBNd/aPyVE7wblxL60z8cGFDTWryiQT9sYv2I
	J3RLmwiXCSkTc1Md02c2KOCJn/VGt/ZyvzY1FDUdO286rNhexoxR6rrVobbZEwH77QcYb0Qvj+K
	koZY61osJGfXDPllecG6tk7TNX/SjZMTcV+/y+UVD6aaEE2vyW+RmJdKMiU2CdybVn/xkDWB6Xz
	sEQSnis8OJvaGkimr3lGh5v9Yzrihar6PjLoA5f/hlSrHeSsyrGVbDggAp4/63Uuoj7W2UdwhIy
	34vPqHmDVZzoSENdXoN23IuOXX7zMP3X5sgylGt1f30GchQj/8R8s9+J5d9aPY9nHZwHyybn26R
	u4spGxiao1fL+9GqcNCwNilPlQe5CWcbChkgq3Bh0+fJvQxRrgLHabnr+v6EAENBvWVzNVO/4ai
	4Wh9s9HkKTor1cxJDx4/NveENqwc439Ah55WKPeO3EPX9dE5rQzG0Q==
X-Received: by 2002:ac2:4e11:0:b0:5bc:c9e3:d5bc with SMTP id 2adb3069b0e04-5bfcad1f499mr228031e87.29.1793140244602;
        Tue, 27 Oct 2026 15:30:44 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5c9ebdsm205370e87.84.2026.10.27.15.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:30:43 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Calvin Owens <calvin@wbinvd.org>
Cc: linux-kernel@vger.kernel.org,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alex Hung <alex.hung@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	George Zhang <george.zhang@amd.com>,
	regressions@lists.linux.dev
Subject: Re: [PATCH] Revert "drm/amd/display: Allocate DCN32/1 dmub memory to GTT"
Date: Wed, 28 Oct 2026 03:30:37 +0500
Message-ID: <20261027223038.299768-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org>
References: <25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org>
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

I see the same kind of single-frame band across the whole screen on an
RX 7900 XTX driving a 3840x2160 TV over HDMI, and measured a637a140ab86
against the same parent: 35 times more events, over about eleven hours
each [1].  What I found since may help decide how to fix it: here the
band needs both the commit and DC switching the memory clock through
sub-viewport (SubVP).  With either one missing, the rate stays at the
same low level.

Events per 1000 eligible frames (frames whose neighbours show unchanged
content), counted with the CRTC CRC as described in my report [4]:

  kernel                 refresh  SubVP  events / eligible  per 1000
  1d8327353de6 (parent)  4K@120   yes       7 / 3,019,571     0.0023
  a637a140ab86           4K@120   yes     293 / 3,632,444     0.0807
  7.3-rc6                4K@120   no        5 / 1,582,072     0.0032
  7.3-rc6                4K@100   yes     139 /   712,333     0.195

7.3-rc6 contains the commit.  The 4K@120 runs with and without SubVP
differ in the TV's VRR setting, which decides whether DC may use SubVP
at that rate; without SubVP, DC keeps the memory clock at its
maximum [2].  In the 4K@100 run, 138 of the 139 bad frames have CRCs
that occur nowhere else in the capture, so the content of the band is
new nearly every time, which fits your "non-framebuffer data".

A second user, on an RX 7900 XT, sees the band over HDMI and over
DisplayPort whenever amdgpu_dm_capabilities reports SubVP enabled, and
not when it is disabled [3].  The DC debugging documentation describes
this kind of symptom: "a horizontal fillet of flickering happens in some
specific part of the screen.  This could be an indication of
Sub-Viewport issues" (Documentation/gpu/amdgpu/display/dc-debug.rst).
It suggests force_disable_subvp to check; on a stock kernel that is
amdgpu.dcdebugmask=0x20000.

Since it reproduces within 30 minutes for you, could you check three
things on an unreverted kernel?

  1. The refresh rate, HDMI or DisplayPort, whether VRR/FreeSync is
     on, and what amdgpu_dm_capabilities says:

       sudo sh -c 'head -v /sys/kernel/debug/dri/0000:*/amdgpu_dm_capabilities'

  2. Whether the bars always appear in the same part of the screen,
     as in the documentation's description, and if so, where.

  3. Whether they come back when booted with amdgpu.dcdebugmask=0x20000.
     amdgpu_dm_capabilities should then say "sub-viewport supported:
     yes, enabled: no", and the memory clock may stay at its maximum.

I have not run the third test myself.

The commit moved DMUB memory to GTT because data from DMCUB sometimes
reached the driver late, after DMCUB had signalled it.  SubVP is a path
where DMCUB itself works to a deadline: DC budgets 15 us for its
processing when it sizes the SubVP region (subvp_fw_processing_delay_us
in dcn32_resource.c).  Since the commit, the windows the driver sets up
for the firmware's data, mailbox and state are in system memory.
Whether that can make the firmware miss its deadline is what I asked
AMD earlier [2]; it is still open.

If this goes in, Fixes: a637a140ab86 with Cc: stable would take it to
7.3.y, and a Closes: tag pointing at my report [4] would let the
regression tracker close it.

[1] https://lore.kernel.org/all/20260919200820.799243-1-mikhail.v.gavrilov@gmail.com/
[2] https://lore.kernel.org/all/20261011201833.853907-1-mikhail.v.gavrilov@gmail.com/
[3] https://gitlab.freedesktop.org/drm/amd/-/work_items/5714
[4] https://lore.kernel.org/all/20260829010525.29935-1-mikhail.v.gavrilov@gmail.com/

-- 
Thanks,
Mikhail
