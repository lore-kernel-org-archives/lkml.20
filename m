Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793400252;
	b=R8QZJKoMfWM/efhDmoIL0NTgGJaDMrsfu9UgwJO8O2jzpqdLI5KC5XK/MS/dbBE6Nlcu
	 KkkTJF+4moq2XsQNQTsYPSWh6P/vCMTnyMBiFUwz6Q4usjnOGPrCBwE3nbhNuxkt7V/nM
	 DnI6HDWbElx8PMRn09TpiJuv1zOyZQqvfqAcfkJvvR2SWGz7xM2b2DU4jqr4cXOYw8BVG
	 yVCpGjY2Rd3nMdg6QAp5S2cunwjAFGMHuOw+aPaTnAubtDNgiTMd3ea7wL7C8G7H3lIcx
	 DD+jV2A2Vmsq2VB4YYu+UaZcKsOcg7eR+s2vqfhV+Er7WFyN9KY9142ZwCPTrsJdMZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+vnvo88Pr3dQY7eSVbimo7vIzM+xuPPq1OrMINl+rL8=;
	b=3PZ7q3piZWW4jwSGS+SfWzKcjMZT9vEnke/XT1tiPZyCPvwhboKz2QVWcEMPLnbmgYvb
	 XLmutUc423XMOtvlVNLFsGHAkfo3yfv1j0rc0qJw1JsdeIsRnOaLnbLAFgv02AcYsAcsq
	 MMkYSF4t3bPVvF6IuhanPTv2J43n7U2ny4dTCr7kEmavcZcyQYd5wnin+gnpUnmd4yfDG
	 Oau++dm68is6NVs1FON9Csb6KyGs5mpzg5zxqVbOaQ1OZk5q+5zbaRFqd/DrhK2wkCprO
	 KqcoXPA0WyhQ0ywOaxD7oK6dI4KSddsUHgDubvJQ1I9hrFhGrjC1ioK5Iy7p4yl1AuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DaiZLmwQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F42606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F42606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DaiZLmwQ
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1065334e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793400245; cv=none;
        d=google.com; s=arc-20260327;
        b=Qtwy0BZlG0/pnvOP6HRtPQVOkDIqtIQNUj9gaVnxFJ6KrV/QLzj19ntxEn+verLweG
         hi5EoENXnJ+yON0ptN8NARELH3+z2jqxCRkx/0x3yAblDMkg0ld7V0bhG40XSwzi1ZHf
         S/AiIC5U3ATv4CgBTven6n5FpHTuvuqDHmRQ1VWUrWXOu1nkNujbVGNOIqxILOJ37Z6I
         KR/0CBubaR5WJastxN2mxfC1s4+1bfKKcMgYpdUOtHeJP98CavhI8fD0orJsXp4iKILm
         lvQBUAwzS2KB1ROSLrZKg/4kjBsERlJ3kqtU1zgm8hrHL83G/2KrS4vc4xMUT4A5nLBn
         3mkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+vnvo88Pr3dQY7eSVbimo7vIzM+xuPPq1OrMINl+rL8=;
        fh=W9lSDbATrc8qwhg5t4bVYUUPob/IpfsP2CVzmxtRBhQ=;
        b=E1KHACUqcKcfuKAIqyCffmD2W3J/Vn9iWx8cKSfV+YkUbPFQDxOIXl+iaQcmlbKq1/
         zTXBDfMpgc7yNfBDHZqvkHxXdGy4mzl4AFScNrMhfJxNArrCczl/Q9wRJTuTQZfwBKn6
         5WL9vgtL+t6t5r/NuZJcKp+7LZMukkzDRI1ER6QehVmGbdmNc10OEOGQqPtwFB65wWU2
         2RppW8tT6JlFReQjQy8p6ObyLeXkdlPVbgRKpHAtA/hNjcRqrYXDONSA+g4cClGJm0tt
         oOG/OVZuLLsB+WrsJlTPP1Nm3O7qFlE+Yw44qkw+1aNqhdv36T6TFF2DuacIOz5uDPf1
         hilA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793400245; x=1794005045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+vnvo88Pr3dQY7eSVbimo7vIzM+xuPPq1OrMINl+rL8=;
        b=DaiZLmwQeVKbbcdVOyDCZyZxvLmchXpkwa6kU1MTGUpPaTuPAdDfGq0V4QSy0+e7bX
         b0djsAS8FyOOR3W52Qg6YzAzerrLCBVpq7nY+MxSj0j5lIi2ungzeDifs29L4IGMfolk
         vUkRosIQQ1t+JOdfgYq5iXS7fw9pjV7FBSmpiC1Zgex2wat6xMyz7LwVHydh7FZQ18Pk
         V5U1+RQU9/KzyxvYcSFLDB4cWd1lv+HjWcchRSFrFwNd+9add2cR5WSZFMgBjt05oqSY
         uuu1CuFi3rF5jSHSUWu5guBupRZ5HM+kS6UfQLzvmZ0E/CaNK/UbRTu0rtCd1L2LT4O6
         nvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793400245; x=1794005045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vnvo88Pr3dQY7eSVbimo7vIzM+xuPPq1OrMINl+rL8=;
        b=k36eWYlO95xuI5XlX9Wst9LFzQOnTaVPBw/Wmq5Hi2Yn+P/xyM3d5WEt8PAIto8buA
         SXqFeVcfTSch/MOQiiegc9orLidlFmNuhiyfL/CNI4VKjHCdjA+v7g6n4uD3LHtwfg5Y
         cnqh5dc/0JsLbcgfco1uFJT1VopJ0HDHQynG6VxSBXK8kOMqi/00wh39HZDwgOHZsVL1
         xOA8fdVDjMgDbftt7p/ZcWIuFbRXgRdcoMOdwvq4ZSqM2ex22jbopm10XGUWKcsMF0i8
         Td8CUSIffbCa+zqlz/vbJdATlO6ONap8AcO2XORWwIXiFdWznMo4kRY6Jqm3ZlW9Jf6W
         wv6w==
X-Forwarded-Encrypted: i=1; AKwUvBwTQJDLCr39uY7m7XofBv5MJbUUOvpymK+t/fyS16faIEFKpoorH/49AMZlPepuA/qPTxwp6yTR7AeC9HI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpBjGuXJAzddL8g17+n1gbx4Qfx+v3snaOldP9UNIGLm1LDkbq
	b3eozjGh2y8GuiS+/hSvTMzJgqC6RAJa9MIW1fstFLhUk8py1gCiLTO1kTMyIOXTsKk7oZVu4aT
	CNLXPRjwJ6FIUL++8hnvHj70igOhZiZ/7MHY0ljco
X-Gm-Gg: AYBFou3On/LWY1gmZqLcP6hkbLFqB8df0psY2sQc1MXNI91sGekIf+Js8UqQNrBgfkX
	Q7FWPk9RqApoA381uX8IEMfuvzFJKKZa6y9Kzx3e/Firidj/37VaZS4nM5P+xQRb/FdflC+sax4
	kXZk9vMcFJLR8XyHB1H8SyVgF8q1BULxioeaXZMPn/Fw20Xw1ezYFg1eLJs1joi6Q2smOQnxAR6
	z9krLVORCmiv3HjfAWrxb0aPav7JDonrZIKPZjxlzPYhknwMMqvtxiDYZ9bAYdPVjGJwy3EEgUw
	kAsPKwMIiTSsN/8p5BHkyZltuzuYbUuAOsiVzDgQPeXwOCEhWSgAga0t+QShEAIpU++tdHH/7be
	/Y76lOyxM04iPQAdBF9U4anjG0QQR+EGclg==
X-Received: by 2002:a05:6512:a94:b0:5bf:b246:87a2 with SMTP id
 2adb3069b0e04-5bfd957b610mr1268679e87.10.1793400245078; Fri, 30 Oct 2026
 15:44:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026220546.3114241-1-skhawaja@google.com> <d4891333-43ea-4d74-9fb9-6ad8dac1a446@kernel.org>
 <20261030121113.GB3889730@ziepe.ca> <2c7aa5c1-3af3-4654-b244-1257d05c9d45@kernel.org>
 <auTR9SnDLsLVmnJ7@google.com>
In-Reply-To: <auTR9SnDLsLVmnJ7@google.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 30 Oct 2026 15:43:53 -0700
X-Gm-Features: AclHuK84pmgR6t7GwgKZ09yPCaz9JinHcZg2AVlK1zJKyqi05vBjmcmKbMe2QqI
Message-ID: <CALCETrV5eqg6d9=+BQhCpRwBNe3aCQiut8vxPBs8b7PToqjaHg@mail.gmail.com>
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
To: Samiullah Khawaja <skhawaja@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 10:40=E2=80=AFAM Samiullah Khawaja <skhawaja@google=
.com> wrote:
>
> On Fri, Oct 30, 2026 at 03:39:40PM +0100, David Hildenbrand (Arm) wrote:
> >On 10/30/26 13:11, Jason Gunthorpe wrote:
> >> On Fri, Oct 30, 2026 at 11:20:30AM +0100, David Hildenbrand (Arm) wrot=
e:
> >>> On 10/26/26 23:05, Samiullah Khawaja wrote:
> >>>> This series introduces F_SEAL_PUNCH_HOLE, a new memfd seal that prev=
ents
> >>>> holes from being punched into a shmem or hugetlbfs memfd while leavi=
ng
> >>>> the file fully writable.
> >>>>
> >>>> Background
> >>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>
> >>>> Drivers such as udmabuf and iommufd (via IOMMU_IOAS_MAP_FILE) use
> >>>> memfd_pin_folios() to pin the folios backing a memfd and hand them t=
o a
> >>>> device for DMA. Pinning keeps those folios allocated, but it does no=
t
> >>>> keep them in the file. If userspace later calls
> >>>> fallocate(FALLOC_FL_PUNCH_HOLE) or madvise(MADV_REMOVE) on the range=
,
> >>>> the folios are dropped from the page cache while the device continue=
s
> >>>> to use them. The pin holder is never notified, and from that point o=
n
> >>>> the device and the file silently diverge.
> >>>
> >>> We have the exact same situation when userspace maps anonymous folios=
 into vfio
> >>> and then desides to MADV_DONTNEED the pages. Or any other memory back=
end that is
> >>> used for such purposes.
> >>>
> >>> User space must not zap/punch things that might be pinned elsewhere.
> >>>
> >>> That's not specific to memfd, udmabuf, iommufd or anything else.
> >>>
> >>> I don't see a reason to make userspace (that should not shoot itself =
into the
> >>> foot) a kernel feature it must activate itself to not shoot itself in=
to the foot.
>
> Agreed, for normal use this is userspace's problem. The seal was meant
> for the kernel to cheaply verify at preserve time that nothing was
> punched.
>
> >>
> >> The issue is live update doesn't preserve those background punched
> >> folios and now we have created an UAF attack on the kernel across
> >> kexec if you don't do something about it.
> >>
> >> There was some notion here that with the right sealing flags we could
> >> tell if everything was 'live update compatible' and then know that
> >> these attacks are impossible.
> >Just remember that there was any hole punch and refuse to live update th=
is instance.
> >
> >We could likely implement "we saw hole punch on a pinned folio" as well,=
 but I
> >don't think that's required initially.
>
> If I understand correctly, you mean recording on the memfd that a hole
> punch happened, and refusing the live update if it did? That would work
> and is much cheaper than what we do today, where iommufd walks all the
> mapped pages at preserve time. For truncate, the existing F_SEAL_SHRINK
> is enough or I can record that also on the memfd. I will send patches
> for this.

This entire situation continues to give me the willies.  After much
prodding and contemplating (in my own brain), I got a friendly LLM to
report:

--- begin AI output ---

IOMMU_IOAS_MAP_FILE uses memfd_pin_folios(). Collapse [MADV_COLLAPSE
or khugepaged] checks the old folio=E2=80=99s reference count, so a pin
acquired before that check makes collapse fail.

  The problematic interleaving is:

  1. collapse_file() locks and unmaps the old folio, then passes its
reference-count check (mm/khugepaged.c:2446).
  2. memfd_pin_folios() (mm/gup.c:3483) obtains the old folio from the
file=E2=80=99s XArray and pins it, without taking the folio lock.
  3. Collapse copies the contents and replaces the old cache entries
with the new huge folio. It does not repeat the reference check or
freeze the old count.
  4. IOAS retains the old physical pages; accesses through the file
use the new folio.

--- end AI output ---

Is this correct?  I haven't personally verified it.  But this whole
pinning-folios-doesn't-keep-them-in-the-mapping situation seems
*extremely* fragile.

--Andy

>
> >
> >No need for more shaky seals.
> >
> >--
> >Cheers,
> >
> >David
>
> Thanks for the feedback,
> Sami
>


--=20
Andy Lutomirski
AMA Capital Management, LLC
