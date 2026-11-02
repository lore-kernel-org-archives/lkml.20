Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631501;
	b=jwTIUzuRNBs3WimYOP92QHEdqCW5s0dNW2leEu/Wx+H5BxqcU0Ewws+Fubsoq6TvIOV4
	 f8FDVhCFoQYC0L5+xmARZ9OBdbpMrWk4UQlCNcH55lMiUV2I5hePuKN9ypeR1lEbe6QVK
	 Vb0hcQmvlE0ngiotlgQS/uM5/ZdTkGoxhx50LKcUmO+6gqQyrdK7hrqQhEO9ZpM6U26QZ
	 sGxO5EDfv4Rpoj6ujUZFMMC4VyiEt3CyuX9Gg/WLPSNE/CMKyESBSP4SLcqRMpECHbKE2
	 r55gx8upPjBk7bXcGDopr3CvZXDm/zQyfX6VxSdaN7vnXHbwz4/ZZAF1GCWjuQ3UH7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RjJ2Hwu3lUOd6ON7ncjs7o5wy86KpEGCg7RvieuPzxo=;
	b=dG/1tH1XkF/Evg8+TdowpHLeiQ4eff/V/RDoyE/dTJ/77mQZ6cqmyr2sNwezJrrn2uo7
	 d41t11acqYWcXmMxxMyU/0r582bP4bu3STSMz1tU4mPLCYE8Z0C76loI7l7ifcPFcbetx
	 Swg7/kSGZtH9GJQ6JnjKyHam2Gjyg5R2tTq5MwSZkUCg1qW0QUaM0uAOEb3dGlEZJqKmH
	 7LmAMiSrZ/+YPpRCWuKVGk7ihDWoA1lMmc+7P9kssTpuEo6yoFO7OhIegZ+ub+3Bc5nLe
	 gu9wHXDxGW+SjNRfk+jbF9KjbF+MnE1cuRTRPIhrPD3FeybGGmYnOG+R1uqrIFyRxAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BrbU1JVM;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921ED606FB67
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 921ED606FB67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BrbU1JVM
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so19961535e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631499; x=1794236299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RjJ2Hwu3lUOd6ON7ncjs7o5wy86KpEGCg7RvieuPzxo=;
        b=BrbU1JVMgXDshJJm6OHdhOASL1Y8s3HQCSQbgpmxovEp6pdFADDlyUSCWLkbtYPV3q
         8GDaUpmiAwHyn4ySNmbBgpYJLxSAGu+tbVIw5ngdO0/ZJoMhE0B9YWXbYtExpTB0a/Bs
         fXGhljRQ2qfBNvaIfdvZWJd52v1A3Fj1x3Uw4dsNqyhamOugevEBMGc/328+EU6G8VV/
         gHF8FDwHtv4xCoGup3NutYJHXCQU+SYH7f7Uawf7BC2eHAMpPXG+haxmNfEGtkLeXSbC
         ovBiZBjHjdYNsR/36m8DW1Co5/9qZtugpPlNSu6tPWpE9bs34JFQni0D2p84wG/ZoHLf
         VcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631499; x=1794236299;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RjJ2Hwu3lUOd6ON7ncjs7o5wy86KpEGCg7RvieuPzxo=;
        b=hRifl4kzsUd9nkZKclLsEVZP2UDpTGMEtMDitIc1XzMpnxH7+1yZlR4vVBigGouBLp
         4X6OhtL4tAjCXj6i4zpCJalBWlXWOkcgz2o8j+oxvNxKhjJd+ugq6pf+/VJouHk750H5
         mYVhfA75mr1+0CC724XRCqTOXLFjTIRpMBXr2e2E35FPqAKuTGbSyqqe8OuBCsSRBAtS
         4PRzV+Z4YuFa1Zgn2kvtG2+OD+lyqwTw7KcEq8eTrjBp9d572AsCDeRP8JW+tbkwuEhO
         7Zb3cjgWzat01s+TysBWODr0HsqbDf0Sm4mi7P2+kBke6z91WQ8Yjw25rY2Sx7xxJdur
         Cn1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxucV/rgAw11Mo8r0mz40uj1sYmG7wATVVAEdww1LTGiEmW9Eoiolhj3Qcl04bFZDJX3u+PN7l/RvRvGms=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9O7DjVr9kF/DCqoukLtTvRniHVzkLTel1c/pbs7h2GfYX/WJu
	D6KNoB14RF5TjIyz15UVoTcimkhxQ/c5USnQCEGFAD6n4I1RBVPupatd
X-Gm-Gg: AYBFou088gjCRkQs+YkREcm/MiGfFN9CdGweCRB+r2B2Z6a9CzGpb+/lpPYWVZ78lkM
	+7v91rK6c2zoytkJ0bhOqRGQ2YFSWmakSmK7jk3sffcM+JttuhoqzBJzIFA3+jjKjreQYyWCUCZ
	RwX9ENV47RHrbsUkwG1M5WVwZx7knp9imj9QnwB8SCXPG+CEJkhGkBO6f9iqSa6s2w0bmqkPG6d
	ZVBf5dyo7207ipWO3EpdHWICHQO++Gypff5bIMoh0YjkHVbzAKkBX77L9/Tj/id963FWJmGfnv6
	ousvtlHCb188Fva3ePMrS42PFl4Is6kEqGDW8gBZf6+zMX4CxS2oeSDDHmeaC092xrvsyqDFTgi
	mn3vKW5YpCE7OBSTs4ZfHogp1dsOxtwsuQJYN6g1N60JX9ogkKowQC5+F9fe/NDoSBBXpB4Wowq
	EW42g1geDnwAeL5mdhnSwmKMVnCXJDYjM4N/IzKzo2RalS6OokKbiihTUWs8L5YmncegN+yBqU3
	+KOtapISMy0ZhDWDHxyzDEMKyAQ0wXZWlzU1rZKmtQahqkfJ8HmbJ4nYi8fQfrZHkMUPCkck/Yi
	sNvX+/jUL73sQBnbyGPpQbsQ8295dE0QcCuiZAkCSqbhnPSpKTA1Kod9r9c4aNmJ
X-Received: by 2002:a05:600c:4585:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4ac1889d5a1mr230617865e9.28.1793631498658;
        Mon, 02 Nov 2026 06:58:18 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0b4df257sm164791725e9.4.2026.11.02.06.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:58:18 -0800 (PST)
Date: Mon, 2 Nov 2026 14:58:16 +0000
From: David Laight <david.laight.linux@gmail.com>
To: saeed bishara <saeed.bishara.os@gmail.com>
Cc: Demian Shulhan <demyansh@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Eric Biggers <ebiggers@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, Ard Biesheuvel
 <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, David Gow
 <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
 netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20261102145816.00a06c47@pumpkin>
In-Reply-To: <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
	<20260927184414.6c0c8867@pumpkin>
	<CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
	<CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Nov 2026 13:44:37 +0200
saeed bishara <saeed.bishara.os@gmail.com> wrote:

> On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gmail.com=
> wrote:
> >
> > I would prefer to keep only the scalar version of the fused copy+csum.
> > It reads the data once instead of twice, and on real Armv9 hardware it
> > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> > depending on the core (+6-8% throughput). It uses only general-purpose
> > registers, so there is no FPSIMD state to save and it is safe in any
> > context.
> >
> > If you are OK with the scalar path, I can send v2 with NEON dropped,
> > the scalar path only, and the KUnit fix for the x86 zero-length case
> > Jakub reported.
> > =20
> The scalar path seems like generic C code and not restricted to arm64,
> curious how that performs against existing (e.g. x86) assembly

The x86 asm version manages to do more than one 'add with carry' every
clock. That needs the massive out-of-order execution unit and the ability
to have multiple independent 'flags' registers live at the same time.
The generic C do_csum() (I just looked at lib/checksum.c) is horrid
There are three dependent alu operations per iteration.

It is likely that the pipelineable:
u64 sum64_a(unsigned char *buf, unsigned long count)
{
    u64 val, sum =3D 0, carry =3D 0;

    buf +=3D count;
    count =3D -count;
    do {
        val =3D *(u64 *)(buf + count);
        sum +=3D val;
        carry +=3D sum < val;
    } while ((count +=3D 8));

    sum +=3D carry;
    sum +=3D sum < carry;
    return sum;
}
or:
u64 sum64_b(unsigned char *buf, unsigned long count)
{
    u64 val, sum =3D 0, carry =3D 0;
    unsigned char *end =3D buf + count;

    do {
        val =3D *(u64 *)(buf);
        sum +=3D val;
        carry +=3D sum < val;
    } while ((buf +=3D 8) !=3D end);

    sum +=3D carry;
    sum +=3D sum < carry;
    return sum;
}

will generate 'pretty good' code https://godbolt.org/z/K9ob6d8vv.
The first needs 'reg+reg' addressing, the second better for mips-like
cpu that have 'compare and branch' rather than a flags register.

gcc and clang seem to make a reasonable job of compiling those
(provided buf isn't u64 *).
Today it left the 'negative offset from end' loop alone,
but it has a nasty habit of pessimising it.
For x86-64 gcc is generating:
.L4:
        addq    (%rdi,%rdx), %rax
        adcq    $0, %rcx
        addq    $8, %rdx
        jne     .L4

I think a zen5 would execute that at one iteration per clock.
Intel cpu can only execute two clock loops - so it needs unrolling once.
If you unroll it once (with separate sum/carry variables) there
is a moderate chance of it running faster than 'one word per clock'
(two words/clock is probably wishful thinking, zen5 can do 6 add/clock
but some timings I've done imply that memory addressing can use and alu
add).

For slower cpu (especially in-order ones with memory read delays)
you may need interleave the code, eg giving the loop:
    val0 =3D *(u64 *)buf;
    do {
        val1 =3D *(u64 *)(buf + 8);
        sum0 +=3D val0;
        carry0 +=3D sum0 < val0;
        val0 =3D *(u64 *)(buf + 16);
        sum1 +=3D val1;
        carry1 +=3D sum1 < val1;
    } while ((buf +=3D 16) !=3D end);

I didn't try those loops when I was timing the cksum code a few
years back.

They have the big advantage of a small loop stride.

David

> optimized implementation.
> saeed

