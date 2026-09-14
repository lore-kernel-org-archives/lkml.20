Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89D8418365
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375922; cv=pass; b=e/9DyBFqVJWABK+wZbjmcdKUjVOibCpdXayzdI60ZbeHo8+WR/J0GWOJQ6u85+v1HveUNVf9n5hnQmjp7PzinIzc+pD7PuYO/0qbBtWcLLeIidgloCYoTXogholvm8bHqcTRTqN1np6C6AKyhvbhKz2rRXnsABXZ+oRXAHTIY5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375922; c=relaxed/simple;
	bh=s0IQRBULRSREkBXiJxQerK1P2mP+hz74g8gbDFVz8qY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eI3bBYxIVz7tYdmCIyt5rCiZn30bHbay1sQqzNi9uN70RpsiItwcMSwXCli0F6slO2MV8sau6Bw9r0UfuGq+VjBuR5GArpxhl50vzTZvK+b6MDUM5RmtuQmk4pDS7i9P4DvvKhsN64EIBYkXWQ44lFlL2EgMxS5w7w0voQk5g/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNZ0b1Vy; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNZ0b1Vy"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso306525466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789375909; cv=none;
        d=google.com; s=arc-20260327;
        b=QRPYjiLzwxqK6nrOekTeKMqFbz+5PN0eb7rQMKizFYWjQoxkPZ8NUs6FpSjldl/455
         g33mxcFNkV8nx2cuhuZ7koASzNM7BY8dhunWY0zUiTw3O4iGMaVot9pCjMitQGHmxCO7
         UxxSnybZ1a3K1p5A3L8B4CEjS22STYFV6nIUs73IosD/AXclx/jguqSoR70bbdb9HTdd
         Ld6ecg0yqE0i6IntdHdfDFuPoosES+O98rAb2MMHq9y4x6Bhzfv+D0VE5UED7LLj0LIi
         /qaVnZF90hosA6ngOxoAVhyQxoFarery6eXoBKHkE7LF5jSgtmYXl5qYW8RlW/Ebrrls
         oTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R3UMbxOgugSG7IAZrpMa2G2BPgwFHN+IgrIbQKA7Da4=;
        fh=XljvMM8MFOaMwi+ihwwkWfSQqUMDmS7njYioKOD99EY=;
        b=XFZ4DwkqgM7IKX/W+Se1CcB0cSI5jUZ0DZHVU3QZtS0wCFRhMVBMy6J2f2FrnnImHC
         qjZdd1k7uxnZ0a3+f7lwGAsxdMXkfmG48718W4vSGEj8unzQvNo836RWqPUnVtWqUuex
         Ah5N746Y62TfW2k4Xw0WqUqL6pLqr+IWIbqJJ7wNSgIFrhxY0GUmMdMH8szIoC1Mn/FH
         ljug4QKzwHTy/k8MeCZRsT+QdexnoP+NrQmi4bR6qL1GRJZw5Zs2WWpsojBtKTmi6rlS
         5VtsqnMgO2kF9/NJViaQhzuqmsBCX8aqSdqt5qb3EMvBzs3y+7Ce8AMVo733qkJxRtxH
         n+rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789375909; x=1789980709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R3UMbxOgugSG7IAZrpMa2G2BPgwFHN+IgrIbQKA7Da4=;
        b=BNZ0b1VyrxB58XR1bbTWDIMekoS8fgQjNiYH3d/Fd7mjk9ibmjdLPX4hUqynH/Nbg/
         +WewE6fjqMM+O/UvReiLcL37Ii2VoxAQuU6sRxmqP5p5wR1pEXdIthOON2N/0BS4BbAh
         nwKDhMxSDvHq3wOoNgrjCBmGp7m+oUFUaIXdPa0rFSLQmQEXkXYoHm3RfoNUAQX6Nb7d
         wmSDF1aeI902KwtIrt9zcLv1QlOVU8i2jOOgUjj+Qe2hEk5n88oG954irui6qXkYH3Tf
         WRxoPIuKpz7Ax31W4W53TGsw+OHlpw7rKbQnl+wBTozPRPDTiz00iBQrjzfQLko9Nf0C
         yWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375909; x=1789980709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3UMbxOgugSG7IAZrpMa2G2BPgwFHN+IgrIbQKA7Da4=;
        b=fMSh+epN2hG5ym+WPXkJMweudZVb3i9u/J6/k03sTuZEjJibHZegh4EdK8ph+XIoDk
         VmcpYkkqL/DjoDldcNHrpzvI13MXeD16VLlWdCRs7lZUkRryBxG108bY28g+CWcwNV1U
         mUyKn3piQj5FQuH0YurH2nzn71WFlP96Dvq5A7bae5R9PdX9QKrgb6jydF4Kihia7aFy
         /4d4HodyoVDojHCfRVWkN+sbNg3xmY5tHNUbmQnvM2frPma72O+Zuh5Sy86N2sMqEJwT
         OVdwEKzFgmPeaG3FI5m1u20tJseAUQoSoreue1NFFnEAWS3OW9tlz4mnZ0p+QDnWG1EH
         EW2A==
X-Forwarded-Encrypted: i=1; AKwUvBxNmsIxn9XcusUmfPfx99fQ/rpBnMfzH5Y5Zy4rE/9la288IFbVxikhuYJwF2Hj2s23K80aIHuDIP+px1A=@vger.kernel.org
X-Gm-Message-State: AFuF++mjCwYwy+uaHKNKoQw2x7i/MqgDRf6Dxo7WGS9QNmTsQwoPrg4x
	UowP1LuXEbvAtRoZxQzLZnhBjZUOThpT8gOJfP2lhlP2MGmAr5iFrTFkXkq7m/qibBSuJ1zYCgG
	DGQJ4UU6cj60FwHkGzjgBgo0hsHn+NW4=
X-Gm-Gg: AYBFou0s8sC8HjJPyE3v5I5uOOyiR59uhbQabamNNA4ofV7kE12uPGln8YtC60Qqq6P
	ZD7GLSIVwSNCjbUZ4LRuEofTRb0Aqv/jMdZbSxGEE2As8pLZDBk3i/E2kg31OWifl8uExe8tNNa
	Pfe2dPBsT+hVJ/FzBgZjSZKvdUKGpQMMXBpGvg4dAc12peaQ/yrrjmEaVK6jWE8clHsbl+D7V4S
	shrP+eubmP0zscYEOolvT3a0+6k61q1XBHoa6JRrM64cFGT77ExyBSIEnF81wohUdnJZJpWGcR5
	psVE4ppIzy4XKI5ovq+b5D2EXkYwhnEqISUpRNsBI9hOPL+nfg0fpKrorL9rmto07SHm5ycUFfM
	vz/ZM+HePSVMzzg==
X-Received: by 2002:a17:907:6d21:b0:c29:72c7:c3bc with SMTP id
 a640c23a62f3a-c29b85faa47mr101080866b.9.1789375909393; Mon, 14 Sep 2026
 01:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9214e36bf738fcfba86acc8cea85dff4010f66b0.1788918714.git.baolin.wang@linux.alibaba.com>
 <CAMgjq7DdF_fi_MserE_P_AbKR23mrqPLZ-VD71eXH6iv1ncdzQ@mail.gmail.com> <b5263014-23b7-4e8c-9bd9-18198409d0f1@linux.alibaba.com>
In-Reply-To: <b5263014-23b7-4e8c-9bd9-18198409d0f1@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 14 Sep 2026 16:51:12 +0800
X-Gm-Features: AcwNN1VGoSxCGWU9eqz04k5vB_v9B_dE8liPLln5Jh58sMbJiJU5sjqfRhynzKQ
Message-ID: <CAMgjq7CcPfOnAjh1EVRu8-YtCaWjCfx=07Q4RLxF1yV-bj2NPg@mail.gmail.com>
Subject: Re: [PATCH mm-new v2] mm: mglru: clear the reference counter for
 rejected folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, hannes@cmpxchg.org, david@kernel.org, mhocko@kernel.org, 
	ljs@kernel.org, ridong.chen@linux.dev, baoquan.he@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 4:24=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
> On 9/14/26 4:09 PM, Kairui Song wrote:
> > On Wed, Sep 9, 2026 at 9:57=E2=80=AFAM Baolin Wang
> > <baolin.wang@linux.alibaba.com> wrote:
> >>
> >> As per the comment on LRU_REFS_FLAGS, when accessed folios are promote=
d to
> >> a new generation, LRU_REFS_FLAGS should be cleared so that the referen=
ce
> >> counter can start over.
> >>
> >> For folios rejected by shrink_folio_list(), we clear LRU_REFS_FLAGS an=
d
> >> set the PG_active flag when lru_gen_folio_seq() would place them in th=
e
> >> oldest generation. That's fine.
> >>
> >> But for rejected folios where lru_gen_folio_seq() returns a generation
> >> other than the oldest one (which can be treated as a promotion), we do
> >> not clear LRU_REFS_FLAGS. This can violate the promotion mechanism. An=
d
> >> this means the rejected folio enters the new generation with stale, in=
flated
> >> tier bits, which can inflate reference counts and distort eviction
> >> statistics for these rejected folios.
> >>
> >> Fix this by clearing LRU_REFS_FLAGS for rejected folios. Of course, I =
need
> >> to evaluate the impact of the changes, which mainly falls into 3 cases=
:
> >> 1. When lru_gen_folio_seq() returns the oldest generation for rejected=
 folios,
> >> there are no logic changes, and they will be put back into the 2nd you=
ngest
> >> generation.
> >> 2. For rejected folios with PG_active set by shrink_folio_list(), we o=
nly
> >> clear the LRU_REFS_FLAGS and do not change the generation.
> >> 3. For rejected folios with PG_referenced set, the original code would=
 put
> >> them back into the 2nd oldest generation. After this patch, we will pu=
t them
> >> back into the 2nd youngest generation.
> >>
> >> I think case 3 is also reasonable, before commmit 6cbdd9726fb5 ("mm/mg=
lru:
> >> use folio_mark_accessed to replace folio_set_active"), a rejected refe=
renced
> >> folio was also put back to the 2nd youngest gen. Meanwhile, I didn't s=
ee
> >> any noticeable performance impact on my 32-core Arm machine when runni=
ng
> >> 'make -j32' to build the kernel inside a 3G-limited memcg with either =
zram
> >> or NVMe swap.
> >>
> >> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >> ---
> >> Changes from v1:
> >>   - Update the commit message.
> >>   - Clear LRU_REFS_FLAGS earlier.
> >> ---
> >>   mm/vmscan.c | 7 ++++---
> >>   1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/mm/vmscan.c b/mm/vmscan.c
> >> index 40d3f1b48a74..1557679aadb1 100644
> >> --- a/mm/vmscan.c
> >> +++ b/mm/vmscan.c
> >> @@ -5020,11 +5020,12 @@ static int evict_folios(unsigned long nr_to_sc=
an, struct lruvec *lruvec,
> >>                          continue;
> >>                  }
> >>
> >> +               /* See the comments on LRU_REFS_FLAGS */
> >> +               folio_set_lru_refs(folio, 0);
> >> +
> >
> > Will it be better to mention that we never add the folio to the oldest
> > gen (since `folio_set_active` below prevents that) so this is
> > effectively promotes the folio by at least one generation? Maybe can
> > be combined with the comment below.
>
> OK. How about the following comments?
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index c2eb8fa9d5e5..a1ead7c61054 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -5071,10 +5071,13 @@ static int evict_folios(unsigned long
> nr_to_scan, struct lruvec *lruvec,
>                          continue;
>                  }
>
> -               /* See the comments on LRU_REFS_FLAGS */
> +               /*
> +                * See the comments on LRU_REFS_FLAGS.
> +                *
> +                * The rejected folios are never added to the oldest
> generation,
> +                * so this effectively promotes them by at least one
> generation.
> +                */

It looks good to me, thanks!
