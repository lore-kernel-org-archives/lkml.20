Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794245727;
	b=OmDJ/tfD81ReKKloTijt+/1KWyEBGHGRApkpdnFRtiOeVMC+9/1rdr601V3L88vXs8k1
	 3EIepF9m5HJ1E4/O6NqEd9HRevOka0wN4Tb05J/0x+687RA/oEHEWkMV2BzCDG5b9yo7B
	 NJ1VbUN79PXzmu/tZ3ixLknu+JlxpwolT3249kFxYBsEq0d1Y3SdSaicKfvxoHhowwZFV
	 8A8YLLWiuV87Fwika0EMmzoULYWsYyZqFqZ7UHnrn5/8NRWSO+kQerDePAFhFNrauL5x9
	 GMDZYU0+MwZqFlRkRulBASgPufpv3kTJmTYSJpj2+VtgP2ifTiGNZMAn2gxWi9ABc+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l7ipEMJZfKt5QXH9IG6GaoWGg4lbzb6pAGJlboFPwcQ=;
	b=3oKtU7/Ipn+CXIDgemTHQJT6mW88wD1eVtFQpeOAXbCHvancg1wvQeedt3C62q4RfC0s
	 N8UkkD0l1RRIIDty8wW2VvZQloX6I53yPe54ru69KFBNLTeLhYgMLU5HEGEPQ8+rjJqaw
	 pjye/BOOyLqOeKQ8XztO3gdKCjhbpqHdNbUkUec2755p5SyZ0aaju6IonnKgN6y3mnTeD
	 YR+nlOCJ916UBFVqjzO5Hk3QLI462k1aDbBCfOxHR/eqf5y8M/21NIA5x1ncggiq6BXXD
	 PIHr3tMv5I+3bU/tfreG8K9sUwLXDgaicC7kr/hqEvuJpwPS9lIVukcPgLA/PkrwcaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="cbZFyu/y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A1A606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A1A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cbZFyu/y
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so670131b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794245725; cv=none;
        d=google.com; s=arc-20260327;
        b=Fo9oWyOXOCstan8iIGs+yzEqtOE0UIQbi8kLrs5+awmzl40s1aeK38Kcq9vyikajWm
         wgLoC12YYf/AkIEMBbPCYdrZv/d6FRHFMZnT77W5ANQfY1oD/b6v48cb9gULKTSKBXfG
         CGBB2o4WaGCeAUjXILOI4yomQExLxosKz+6qbiTYwqGcEKTzQml2rXyv+jt9LkU4vat6
         +utDqvepUvyL24yGUuNl4a3FuNhu9YtWKfrEmRUS4UmHxIBVrFGWQLo5KOUgmPMesOvV
         0XBFMm2Dy99R5xXOFeCK3NhQ6b58lFyttrgBRRzwItcs4PUu5J4YN6FFsGeu2dkg4q3/
         xHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l7ipEMJZfKt5QXH9IG6GaoWGg4lbzb6pAGJlboFPwcQ=;
        fh=g7F6SRcR29zFdM68+fIbNHqQoR25ecI0cO15DmjiT5s=;
        b=QTd8q8HOfiLa70lXTkfmb6YV/w78DqJKkNhLVksF2klpYRkCrfOXl4VSreHlqaZF92
         WhRAwgTrtxlzzBPjvl0F3JTUwXZpPPwBcHzw1FUxDcMKJJozdad3IUEbayKZ+YUrefs3
         iUsJFm/Daq33YgSBkRjZvZ6tXxaWQiLQjWlmjvchaMkVIaf/OqQjJ/KHARss1HNjApzf
         VRv3hOa6QtydoL5bc8JZva7KYRSvzOOJHFKiw8nPm8UjvhNurwrrz7Ag7uYVs7X13JCr
         AsYYAzmHlnl6spkBPQmqKz9mYu1NjPIzGUgoUNaNprQLuEOLDKVfd8PvGOrNezskV6x2
         30/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794245725; x=1794850525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l7ipEMJZfKt5QXH9IG6GaoWGg4lbzb6pAGJlboFPwcQ=;
        b=cbZFyu/ympslBuIh6poY9KgizLvO6DKdEPXkeitWX7ov3Kg0Xvt+1xuf9Scdzdj9B+
         8Uu0LNK2toOcHGGI0rUbxA497Q4cfiM61anQzlSptrUhEiYbfiHdVPiSrn1fAYWM7gyv
         htRSdojLNw6tC7b3uulCFaAuYEP9TupJnrP2kgBJVVH+ykuxv+pLc3Qm5LJhG5+J4/ac
         NMZg3aL2rqnnq42zaNIdq0hABRZemd77f9NVA6g9hyAbg3bP/zEGajOmLHB1pIcC28ln
         YzqWQWQh7xy2tcNi3zrmajgt9OwTm/9E/ox5mX21sFYf15dOgycdkH+CFal+g6C+rWjP
         Ke7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794245725; x=1794850525;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7ipEMJZfKt5QXH9IG6GaoWGg4lbzb6pAGJlboFPwcQ=;
        b=Vga78nxVevzrOQgT2PGA20WI1mECjC6t9e9RSTEk0Cr0pDAcyR50Dc27FhtywGWMIJ
         vAK79jXieglzvC2EMC/Ktc2ET5gnE1rVtvQbSZJ84+rldX4kxqt5aLHaBSJt1lRW3kDu
         A8Pv5L5XZHlPWx0t9j9RUEvWFoGBT3jGiy/nzvZMTIwaiwCDi3XYhNUPWen5VQEcbgyH
         IrSCvVD/yWDXCdOhUG4z7LfqhsQtf4zRMytaQB3Jp8f4kndOQRJfEyTdUEHY2nUrRS0S
         G22UyHAr4uTp+VFNtKJCXEQsmN3d0XF3JiEILx1Ajt2GzSTYI9MIOxZUzvRkRBYquX8Z
         B2jQ==
X-Forwarded-Encrypted: i=1; AL+hErHiI7zBPrrPrlp7oEyV/U8y7LAkUCPlHdLwkWZ++Dg89aoZd/rcJRDipiz5OSlCRm7e3aLcx8yZ1QGyEng=@vger.kernel.org
X-Gm-Message-State: APuU4Z9azRaax5ojZAUL+AjSg77HCPusug/Q68Cu84SyqZ2USPFJPUAq
	sVxAjTMJeJxduK/VVgiZ0s5r/ZLhGMkjVvVAso9hQCG/ojNFc9AYHNr5ZmEsQmeN2QliiG3xA4O
	ViLd6SjKsvnskiRrFvYysxsdi+WRp7NHinK1hQSlD
X-Gm-Gg: AYBFou17yc7oY9NSwNfKs5JBAjzEvgEmFRVoYd0YO4Io1+UNe+5TFBhk+dwVv0r3EHm
	vPKHu/VIPfVgwGU093cMkBxcJ/cEuVXMkY110O5EOlSQgn5LfsZ6nL5txq1rrzJcKqIrrWunze2
	/mb9IubYbd1jx8hEcRmyEINXjzUVIVug6MzDjxpiYIFurXxPhTMlPLacE3ts1LxC6a9KHAXSUra
	q9HTd7G1v6SVsDjsX/YJ6uAGRosmXJ+pki1F4JyugavwJgyTD0ZrL/KnHg8usBWfP3/l8GT7TcD
	6cv4BkxnEhnIaQkK+elI+OdiDtvjT0LtOA05vppfLH0Nd7SCVYtlwnV7i1OfuVdMTdMC1EDo/5C
	nSkkfKNc4ZZhv7C2YzEieeNmPPwYjLGGCiOxTmDKkqtv6alA/WRWBARer1kJaEzNNcWEN34/npG
	yuMg7K8p9AOYff2eCs/sXMXKSMsYk1ZVsLx6H6EhcsHeVqhZQjD9vuC2yNT5Ay+fSnZbVPzFE1r
	YR0IQFx
X-Received: by 2002:a05:6808:1829:b0:543:50ad:baae with SMTP id
 5614622812f47-5683ce02157mr265411b6e.63.1794245725006; Mon, 09 Nov 2026
 09:35:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6af144ed.f50b2b3a.2c0de7.0010.GAE@google.com> <20261108202849.2e5c40a630e66dd39334a915@linux-foundation.org>
In-Reply-To: <20261108202849.2e5c40a630e66dd39334a915@linux-foundation.org>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 9 Nov 2026 18:35:13 +0100
X-Gm-Features: AclHuK-hI9rJRz-mT5ngogTQCjiUzkrA1dTOphNK2ymjlIr9_nFY1-IjXf1wnBo
Message-ID: <CANp29Y5m+47Y5n3Y8WvCEm2UgzGBOnpMK2eqY4aO1L+hQb1yNg@mail.gmail.com>
Subject: Re: [syzbot] [mm?] [bluetooth?] BUG: unable to handle kernel NULL
 pointer dereference in __refill_objects_node
To: Andrew Morton <akpm@linux-foundation.org>
Cc: syzbot <syzbot+73e34786d639a8eb1324@syzkaller.appspotmail.com>, 
	bsegall@google.com, david@kernel.org, dietmar.eggemann@arm.com, 
	juri.lelli@redhat.com, kees@kernel.org, kprateek.nayak@amd.com, 
	liam@infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	luiz.dentz@gmail.com, marcel@holtmann.org, mgorman@suse.de, mhocko@suse.com, 
	mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org, rppt@kernel.org, 
	surenb@google.com, syzkaller-bugs@googlegroups.com, vbabka@kernel.org, 
	vincent.guittot@linaro.org, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 5:28=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Sun, 08 Nov 2026 19:58:37 -0800 syzbot <syzbot+73e34786d639a8eb1324@sy=
zkaller.appspotmail.com> wrote:
>
> > syzbot found the following issue on:
> > AI-generated root cause summary:
> > In mm/slub.c, __refill_objects_node() replenishes percpu sheaves by det=
aching a
> > freelist from a partial slab via get_freelist_nofreeze() and iterating =
through
> > the freelist pointers in a while (count && refilled < max) loop. Becaus=
e the
> > loop condition only checks count and refilled rather than validating th=
at object
> > is non-NULL, a prematurely terminated or corrupted freelist (where fewe=
r objects
> > are linked in slab->freelist than the expected count =3D slab->objects =
-
> > slab->inuse) causes object to become NULL before count reaches zero. On=
 the
> > subsequent iteration, get_freepointer() dereferences NULL + s->offset (=
offset
> > 0x400 for kmalloc-2k), resulting in an immediate kernel NULL pointer de=
reference
> > crash at address 0x0000000000000400.
> >
> > full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3D73e34=
786d639a8eb1324
>
> Thanks.
>
> : This looks like a bad syzkaller test, not a Bluetooth bug. The
> : reproducer runs as root, opens the active PCI device's resource0
> : (mode 0600), and maps its register space writable. It then places
> : syscall arguments inside that mapping. On this GCE VM,
> : 0000:00:02.0 is the NVMe controller; its BAR contains live control
> : registers and queue doorbells.

Yeah, it's unfortunately a known problem.. Sorry for the noise.

I've just sent a PR[1] to prevent syzkaller from manipulating those interfa=
ces.
[1] https://github.com/google/syzkaller/pull/8111

> :
> : Both crash logs show NVMe completion ID and generation-counter
> : errors immediately before the SLUB fault. During minimization, the
> : same program produced crashes in several unrelated kernel paths,
> : including runs without the Bluetooth operation. This points to
> : disruption of the active NVMe device and subsequent corruption,
> : rather than a demonstrated SLUB or Bluetooth defect.
> :
> : The logs do not show the precise MMIO access or establish how the
> : freelist was damaged. Please rerun with the resource0 mapping
> : removed and the read buffer in ordinary memory. If the SLUB fault
> : persists without the NVMe errors, we can investigate it as a
> : separate kernel bug.
>
