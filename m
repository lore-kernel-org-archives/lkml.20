Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691482;
	b=SmB7bW37IrRLTN+Ca6Q4cPcxTwISuCkg/UMTxUJEiRaAn5ObniIDZxNm5sk/OFZ4R7Ue
	 D8pnqNJ1ZijaUUxGMwasbGPLDK4AvKvtDG3Nem4tCxqiQhnJRfsxsZdBBic+WxeGHIcVG
	 7dDe/EJNb8AEyUQdySPh814kT5AY9ZBE3vdpUgd7nLUO0ANCnDDNX6UzcSUpf5jl3Ll+w
	 Q0/I8+WFBl4ks9jOgdHIISGH/yaK71zz07kVIYx6UQtzOMYy0q+l3DIFs33kjpLiD5O+S
	 9u4rI3+YSifa2eW3Q1FPXVQ2dT8Srr/MyE7yJigDB7qP9BrpQ9LZ4JEdPVMErkbJUiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=VXuE27163XQs95Y17MHXQoRtZevE9c0I3KUjJaU7M5M=;
	b=KgMnvI3cWKe+sMNsBdAV2MmVKEMh5FXtegCX68V99OsWKULN57diqXkrmy94bRq4Dr0A
	 +rIXmsI+OhV5K1swqVpEeS+jsGjd2BA8Hn5dNCmHHzGuSp1rZBwNm4JVo1hytp0FHL5cs
	 goUpCqEiBosLQH3VpwfgiD18J2gS6JDu0ET0LL8hsCCfvLqqJzp8YXsE62/dork08NWsf
	 EVA8pYkSr6FuSA6u34NJ73Sr+RY1/MEgRVwF+AGfEJn4v3WDQWJNcgybx+dS951YkJjcb
	 Z1ReZ80yD37WUX7gQVWHFyIMp8vNNonLTANMGdbd4VbTHwPeq5f6QkmGw52485GelSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=p1qG8FoI;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0477606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0477606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=p1qG8FoI
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e60f9af6e6so4955ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792691481; x=1793296281; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VXuE27163XQs95Y17MHXQoRtZevE9c0I3KUjJaU7M5M=;
        b=p1qG8FoI+FjuKYeesNRnsPhbCfDhwml/usg+eoDHGMWDq5c9L7RoQnXbQ5ygdFeImB
         Y96eZVBRy7Flrobq9DvnlMx/EAyJVDf7WJctSTtuGbVgjeFDs2m6RTwwiSPC0LmBVkCm
         q//xVinr9gtMZoWgq1NQIFL0uzwGwE/V24ZLVIW8G1yhe/wB+Gcnn5u1YQQUqbWmIrjh
         Uo02TstCIh822E+953yQvTfk319ia9ovb46tiV339HlH+uBjMURBgFgL/5fgKJcJtArW
         4bmKBPvuelgC1wdGuPmxiJnVYPGFeU5HOJmaXzqnY4h30wYbHVrjjVQ7NqnCfBG7oXxH
         1g2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691481; x=1793296281;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VXuE27163XQs95Y17MHXQoRtZevE9c0I3KUjJaU7M5M=;
        b=OMtOd78NekKoHhIjwbdHem1lxghjolLBbmpU3HmiPqpnBodnwrST+lp64DKqyhJQ2b
         vVttK8MgrFARehyRISExrEE3JVUp/5AycpkpY7HsAswLNzG7a2cvMo3J8o+tLbgk+t2N
         LQr6FlS2Euokrd8AlB+GN23/V3DIHUFXZNSIDXIe03Az100vXt4MCGlX1apKQ1b+g2xd
         pYgIxmp2h3OydAXHc2Nqf+u91Bo5uMDnuVdXpukuELidNJ+YAyrpfv0DrCw/EWelSjkI
         SeFGP0u5TlY6P7d35y8y/uJatZWRmNChv8dTEmvvN+iiaH56tUoV5cW1XQUfKVHlWheE
         G60g==
X-Forwarded-Encrypted: i=1; AKwUvBwqSbt2FRKkK7iRJ88mBSaARN5tQIM905v/2g2+rH4LwQnnG0qYQxWn1RwsYdWaykk03oryzWqNwtsZQCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9YFFn5ISBCwG0RoSHl6nx4qfIGnkHxQ9iw5IHYqfsgViWw7rw
	6RRa5uXFn7d8klBCJl/zARjMe5wfhn5rmKi315Oipk/xskfSAMW6jTLsD8KpfUHk4Q==
X-Gm-Gg: AYBFou2MEoV3om6AlUvEbCTprzUD8dvWeeej5Q9DwKjln2X5HFCh58txQxKd2pf1PDU
	a4bMvPfnT67oomNmgYuTr37A7QzxlUpi3tQb8vK8qjobSadBSJHsuqU8y2SSUyx6qj6Vh0DJ+Q6
	yWL9zP1mIgR9MqmbABRvGTTVvF9LVLlugyk/Q8wJMCuqqJf76UdTcbilABW/MF7k8rO3QP1+CXs
	lDd5GPfQPOcPcviOyD4KPEzsWBMtZZuDqprGk3DTyMJgfH38vBAkHUAAMnFTx5wOuDa5goKXMuM
	C9cgUNu61jSYD5uUad3zer70EK44HIl/jKjgppn4+7L4NxhCpYmiPDtS/LGKYNGNmRy2P8IQXtM
	5vQ/mPMNKFHuIy+fUliTnH9npyt1TaDfCUS1iHQzlVBqe1kMP/kP38vsX+wfLyqK3WJWvRn31P4
	2RDQO5+2kT2ZvL5MwSnREa3D613HPuGx4tghUeyyyXlc5ICIHvlUHORGx88FF7iIeFpKCd9lMFZ
	yLSvkk1mKM7n+A45Kq7ks9PwF/jMRWwot5O///CJ0KWGZoQAN2EyY1osyluwTYI5qipxb8xJCoi
	S4b+0DwF6jKKzR8V
X-Received: by 2002:a17:902:e547:b0:2e9:502a:ddbb with SMTP id d9443c01a7336-2ea43c9f6bcmr53298445ad.45.1792691480085;
        Thu, 22 Oct 2026 10:51:20 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b346c43sm1644745ad.13.2026.10.22.10.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:51:19 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:51:16 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: tarunsahu@google.com, Andrew Morton <akpm@linux-foundation.org>,
	joro@8bytes.org, Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de,
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com,
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org,
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com,
	will@kernel.org, Alexander Graf <graf@amazon.com>,
	Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev,
	iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	kexec@lists.infradead.org, skhawaja@google.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
Message-ID: <atpNFEFIlqAoYIwH@google.com>
References: <CA+CK2bAQbmq3ArP3XMErF_8RC2CUwvgpLY0H83D0nCJTaVKYyA@mail.gmail.com>
 <9huzecdi6go0.fsf@tarunix.c.googlers.com>
 <CALzav=dLdJoVy=B1pv0FAurD9OhAzLSTjJNbtjTdJRmSqaB0yw@mail.gmail.com>
 <CA+CK2bAQRMAEXZyHTEuUN0_Fo59Sn0hBmYbme_J9ewjx6gPyJQ@mail.gmail.com>
 <atlKsD-aJB3mJr2j@google.com>
 <CA+CK2bABt4OZO31TenVF2+uBUWVwViWbvfE00=0xbAw=f7K9SA@mail.gmail.com>
 <atl7peoVHdP5hz7z@google.com>
 <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
 <CALzav=e=ho2gVrn+7KpZ3ZyasvH2u15-pC-RSRSS7KcMfKqUJQ@mail.gmail.com>
 <CA+CK2bAJo8dnTOyKMgnnMnk-SCXbTsv+JCLEOWkjyj-wqtEkHg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bAJo8dnTOyKMgnnMnk-SCXbTsv+JCLEOWkjyj-wqtEkHg@mail.gmail.com>

On 2026-10-22 12:11 AM, Pasha Tatashin wrote:
> On Wed, Oct 21, 2026 at 11:53 PM David Matlack <dmatlack@google.com> wrote:

> > > #define DECLARE_LUO_SER(name, expected_size, ext_flags_count, payload_type) \
> > >     struct name {                                                           \
> > >         __u32 size;                                                         \
> > >         __u32 flags;                                                        \
> > >         __u64 ext_flags[ext_flags_count];                                   \
> > >         payload_type payload;                                               \
> > >     };                                                                      \
> > >     static_assert(sizeof(struct name) == (expected_size),                   \
> > >                   "LUO struct " #name " size mismatch!")
> > >
> > > For example:
> > >
> > > struct luo_memfd_payload {
> > >     __u64 pos;
> > >     __u64 size;
> > > };
> > >
> > > DECLARE_LUO_SER(luo_memfd_ser, 24, 0, struct luo_memfd_payload);
> >
> > This looks pretty reasonable but I would name the payload
> > luo_memfd_ser. The combined struct that DECLARE_LUO_SER() creates
> > should never be used directly since the offset of the payload in that
> > struct is only valid in the current kernel. So I would give that
> > struct a special name that makes it obvious you shouldn't be using it.
> 
> Lets drop the fourth macro argument and generate the combined struct name:
> 
> #define DECLARE_LUO_SER(name, expected_size, ext_flags_count)              \
>     struct name##_hdr {                                                    \
>         __u32 size;                                                        \
>         __u32 flags;                                                       \
>         __u64 ext_flags[ext_flags_count];                                  \
>         struct name payload;                                               \
>     };                                                                     \
>     static_assert(sizeof(struct name##_hdr) == (expected_size),            \
>                   "LUO struct " #name " size mismatch!")
> 
> For example:
> 
> struct luo_memfd_ser {
>     __u64 pos;
>     __u64 size;
> };
> 
> DECLARE_LUO_SER_HDR(luo_memfd_ser, 24, 0);

I think we are getting close, bu I have two remaining concerns:

 * Reserving bits in each flags word for continuation leaves gaps
   in the flag space that users have to know to skip.

 * struct name##_hdr only matches structs written by the current kernel
   (in terms of length of array and offset of payload).

How about this instead:

struct luo_ser_hdr {
    __u32 size;        /* Size of header + payload in bytes */
    __u32 nr_flags;    /* Number of features encoded in flags[] */
    __u64 flags[];
};

Each feature occupies 2 bits of flags[], so feature N is always bits
[2N+1:2N] of flags[N / 32], with no gaps:

  00: Feature not present
  01: Feature present, safe to ignore if not supported
  11: Feature present, must be supported by the next kernel
  10: Invalid

The length of flags[] and the header size are computed directly rather
than by walking continuation bits:

static inline u32 luo_ser_nr_flag_words(const struct luo_ser_hdr *hdr)
{
    return DIV_ROUND_UP(hdr->nr_flags, 32);
}

static inline size_t luo_ser_hdr_size(const struct luo_ser_hdr *hdr)
{
    return struct_size(hdr, flags, luo_ser_nr_flag_words(hdr));
}

static inline void *luo_ser_payload(const struct luo_ser_hdr *hdr)
{
    return (void *)hdr + luo_ser_hdr_size(hdr);
}

and bounds checking is just luo_ser_hdr_size(hdr) <= hdr->size. The
payload is always 8-byte aligned.

Payload structs are then declared on their own, with no header:

struct luo_memfd_ser {
    __u64 pos;
    __u64 size;
};
LUO_SER_ASSERT_SIZE(luo_memfd_ser, 16);

The static_assert covers the payload to catch embedded structs changing
size.  Asserting the header doesn't add anything since its size varies
by kernel. And because flags[] is a flexible array, the header can't be
embedded in front of a payload in a combined struct; it can only be
reached through luo_ser_payload().

I think the only downside is that the header increases to 16-bytes when
there is at least 1 flag. But I don't think we need to be so concerned
about an 8 byte difference...
