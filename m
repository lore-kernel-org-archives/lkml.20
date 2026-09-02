Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D451A76BB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788324023; cv=pass; b=S1l9tzbwx2hP2+UFfzk+/FQF36NuG2eolndCwUHStZolk6QWp/2Hbma1Pu0rDPvEeT6RM7ghM3h/sd2UQzLqydOcQBVQkATaXoz4OQc/BUFm2niM5tQ1vOURZnIRoH+cDIES2KJLbtwtEhqk1ytp+A+wwmS9rsHLMkjDLMjJQLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788324023; c=relaxed/simple;
	bh=hHNM4gxQiQ1/uHUdrt/M8J8zXYcLwE2qjO3Da4m97Os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qh9pA2usetoiR9FKRSYaofyiU0P/hKU7VXnJgiwyUVQK0V4q/IWUnsdb6vryumPQUJEBD2HHKKlhuo9n0etHkSWX89qv8fBtlDdgfBuFo4ImGzq4VcxDcNiR7BrL1HkxcG9gKQKOUbsARVHc07RcDDR/YjICDQh+dwr1U7SoA6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUxJwOsY; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUxJwOsY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so5420825e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788324020; cv=none;
        d=google.com; s=arc-20260327;
        b=Pv19+lc/cQIgNfLoKMv5BuuDHnKBXk3MSaE1bXbq1LsPAxCGfRLjYtF7nkXLkd0pcE
         NxCOzRaFQ77XcPbr35nc+BqZqxQ9r3LWPYGIVXnD9LWlfJgz0bDkROPA/qItbj0hF/ZZ
         2PF7rH7lXAP0GN9YdE5tV9eN2t4YYIlwbR/lBTijmYYigwDiXWONF1NLxxPwYGoUdaVC
         P7aeTWUKOLZjQhHmTXfaZ+3zKwb+DVITUaVlB4HcoWFfhoOYlqjBga+KbgovS1p/hDRd
         78+WXrKFTQYuS7DRGbG41fUEZfrvwBD3PsPtf629huG3EqAZ1FTVsmwfNJlI0inPU1OO
         vm9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pz2W0TKevSUy9BHCvdkAF/hP9udXJxfarvbcQC/ZVQk=;
        fh=cbvB357I95kMKxLagBFz9gwMStKz9uCpOCo46c7kvGE=;
        b=cwWcYbwpgi7h2kUeeyb6fO14rY3bVuuMjeGZKc3u7hs5XEDoYiFdLPKn3XVy3X9lQJ
         N9hJdjF1t9dlfTxS0Izmj5oZWVqXEyMZyQ1kU/0E2nK6NEZgF0cxQDbEjQTnCyDp65ta
         it+C9PJM02THh6/k1KpicjvgpjulmIZfuU0SDeuJzecjVOAZlpzd2uFi0Bm+9hd2DXAi
         eQAQessxyQNdB/HmB2aqe5h+LDDjasea9XJ4YnUuhwr2aFyaPDpLGyY3MiP/uE2vX8zk
         ohs8TgQ/lQRCzjqs154EzAMEoBRqT2fOmWJA2JZGqTu+a4srG7TmOcCvAayaUpg5wOkg
         CPWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788324020; x=1788928820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pz2W0TKevSUy9BHCvdkAF/hP9udXJxfarvbcQC/ZVQk=;
        b=FUxJwOsYnGr7EwgPK2Q4O1afq8GQP/XlNQxr2oHYnYZd1J5yYXgWFW6SdkhGDDFYmQ
         kUm1BY9uTBH9nEzAut0Vf/ua1POCsrY0vVkuG8b/lV6PR6TnZ9D2F8GtuQwG8p7BVG0Q
         WRxnP82nmGw9WamSTUZd2fhNab8Fbe/KbQ777+9Mg2yJZ2VPbvWpB3eivao1YNJMl5ia
         8u4J7lhGpfy5aa4YKXJsakFbNoTEq4OOg9Q6iVVrWD5sVjl1QFUZdZkmv5sVvqG5iNsi
         3WYeYc1Tm52IN5IESnn6qXqZ7f+Brpeajnc4SHK7okc8WWGu8MfsAWSEr1qhHB8V17Oh
         /Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788324020; x=1788928820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pz2W0TKevSUy9BHCvdkAF/hP9udXJxfarvbcQC/ZVQk=;
        b=lV/Qh/tX9lucmjYUFZyi/l8kYWyUVKYZ/S6gMolKdugsgnFC2fj8qSvqOEI5zRtgbd
         7nMBrpooDZm1SAF/ZwbS9HhbkJZomRTcXbxyXE7vAe+LOyJiNHSs/LLnAtjVDJT8Vdh3
         gMxzt5muDKBRyv22ZYdA5s2UHPLZXP7GvvfflElvJ31oLbCIh/SIySokGQ4KL9RjTxjo
         8ForXNim45iRMeDry3v/bdYz1CQ4XeZ7kh4Z4tZHCCHEV4flNN5+md8mTwpCiWprXoJj
         lH3qmo8LkMGfkfAuGU0MD6U08LRLxbYZThrIxegnOAjTAaVB4M5311geSsMFOo8NDsii
         OBlg==
X-Forwarded-Encrypted: i=1; AHgh+RpwVSGhcLblK+L7UpVpDvmo23wtOdwZdC3EUDSJWO7ECaDBtBwG9OJ62jCuWcHfbeqee7RUKHT/mLLRSCg=@vger.kernel.org
X-Gm-Message-State: AFuF++ng0Cyhs2K1f9Asp2Wsf/MGdQfwicaTbsFFGT37DE1bF/XwJuA0
	IL8fU7K/CTlEvEW3G71KIfpaG3RslcPVqT33oL/lGrbKsPRLV/Rc7oGJsJuMO1UP2OGZzdfqNf5
	UPGOM7MRF3QXz1kNj6e+WpiNA1npM7TI=
X-Gm-Gg: AR+sD10lFnE9WG9xttlaXcMm/Ra0kf0qOKknS76HyCbThzbPhJBwPqWFPWJxfapgT2I
	lp7rzknaemDBuphvhUwmj9dp210bvZYeJO7T+dh70eAQiq/w+Q6fLsiuXSF7I1bjghgqLHNU4it
	aIlMdJ7aE9DM8tCUBa7AOhSePEmkNMxmvFHEEFg/7xS3b06VoHGB/uPhmg2nhSvEI5mprN2esQI
	NRF0lz6XNsj8XmJ9Z4qb7/biVgfCSUQgm21fJ7ui2ECHa9YSPxcjaSodhxzPBr09VnRRa8EGdQf
	mOON46jjXc+J9GOWpFimdiAYOd4kSwDRCm37S9VqmhcKaDomVvQW2/nWZppiLTODde7tNQ8wOBd
	Y0J+9T4Zqlkc1UDY9iGBGAaE4khFsoi0Q2Nly7Q==
X-Received: by 2002:a05:600c:4e8e:b0:49c:dada:f57f with SMTP id
 5b1f17b1804b1-49ce57f06edmr28175155e9.7.1788324019587; Tue, 01 Sep 2026
 21:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKJ0_LewRz32U+QCVBJJ0UWeoghGdwNADZp6U32HaGnAjdaoKA@mail.gmail.com>
In-Reply-To: <CAKJ0_LewRz32U+QCVBJJ0UWeoghGdwNADZp6U32HaGnAjdaoKA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 1 Sep 2026 21:40:07 -0700
X-Gm-Features: AcwNN1VAz3Oj0q5N9K4ERR2nE8r6LdeRc7mPttTPsG_m3dIM7uzM41vTOLHUN_Y
Message-ID: <CAJnrk1Z7ef0eCo0zmXwvTyfZ75HE1ayJQ3o-NgKaEGyw07kLEg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BFUSE=5D_Two_latent_data=2Dintegrity_defects_in_the_?=
	=?UTF-8?Q?7=2E2_iomap_read_integration_=E2=80=94_pre=2Ddisclosure_before_large=2Df?=
	=?UTF-8?Q?olio_enablement?=
To: Kanishka De Silva <kpskanna1915@gmail.com>
Cc: mszeredi@redhat.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 9:32=E2=80=AFPM Kanishka De Silva
<kpskanna1915@gmail.com> wrote:
>
> Hi Miklos and Joanne,

Hi Kanishka,

>
> I am reporting two latent data-integrity defects in the FUSE iomap
> read integration introduced in Linux 7.2. Both defects are unreachable
> in stock 7.2.2 today, but activate the moment partially-uptodate
> folios exist in FUSE =E2=80=94 which is precisely what the announced "fus=
e:
> support large folios" series (Joanne) and any sub-page-blocksize
> invalidation semantics will create. I'm reporting now, before that
> series merges, so the fixes can land alongside or before the
> enablement.
>
> Full report, suggested fixes patch, PoC source, and runtime evidence
> logs are attached as plain text files.
>
> Summary:
>
> The 7.2 series "fuse: use iomap for buffered reads + readahead"
> introduced, for the first time, FUSE read paths where a folio read can
> be a sub-range of that folio (desc.offset > 0 and/or desc.length <
> folio_size). Two legacy helpers were not adapted:
>
> Defect A =E2=80=94 fuse_copy_folio() whole-folio zeroing (fs/fuse/dev.c):
> When zeroing is set and count < folio_size, the function calls
> folio_zero_range(folio, 0, size) =E2=80=94 zeroing the ENTIRE folio befor=
e
> copying the reply at [offset, offset+count). With sub-folio read
> ranges this destroys valid, cached, uptodate data located before the
> requested range in the same folio. Demonstrated end-to-end: 1024 bytes
> of valid cached data silently replaced by zeros.
>
> Suggested fix (one line):
> - folio_zero_range(folio, 0, size);
> + folio_zero_range(folio, offset, size - offset);

I think the fix needs to be folio_zero_range(folio, offset,
ap->descs[i].length); else there's the case where writing to the last
block of a folio and then reading in the entire folio will overwrite
the last block. This is what I had in my local tree, after sashiko
mentioned this a few months ago in [1]:

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1240,17 +1240,11 @@
  * done atomically
  */
 int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
-                   unsigned offset, unsigned count, int zeroing)
+                   unsigned offset, unsigned count)
 {
        int err;
        struct folio *folio =3D *foliop;
-       size_t size;
-
-       if (folio) {
-               size =3D folio_size(folio);
-               if (zeroing && count < size)
-                       folio_zero_range(folio, 0, size);
-       }
+       size_t size =3D folio ? folio_size(folio) : 0;

        while (count) {
                if (cs->write && cs->pipebufs && folio) {
@@ -1308,10 +1302,25 @@

        for (i =3D 0; i < ap->num_folios && (nbytes || zeroing); i++) {
                int err;
+               struct folio *folio =3D ap->folios[i];
                unsigned int offset =3D ap->descs[i].offset;
-               unsigned int count =3D min(nbytes, ap->descs[i].length);
+               unsigned int length =3D ap->descs[i].length;
+               unsigned int count =3D min(nbytes, length);
+
+               /*
+                * The reply may be shorter than what was asked for, in whi=
ch
+                * case the tail of the requested range needs to be zeroed.
+                * Only [offset, offset + length) may be touched here: the
+                * rest of the folio can hold blocks that are already uptod=
ate
+                * or dirty, and clearing those would lose data.
+                *
+                * Clear the range up front, so that a failed copy leaves
+                * zeroes rather than stale folio contents.
+                */
+               if (folio && zeroing && count < length)
+                       folio_zero_range(folio, offset, length);

-               err =3D fuse_copy_folio(cs, &ap->folios[i], offset,
count, zeroing);
+               err =3D fuse_copy_folio(cs, &ap->folios[i], offset, count);
                if (err)
                        return err;

diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -90,7 +90,7 @@

 int fuse_copy_one(struct fuse_copy_state *cs, void *val, unsigned size);
 int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
-                   unsigned offset, unsigned count, int zeroing);
+                   unsigned offset, unsigned count);
 void fuse_copy_finish(struct fuse_copy_state *cs);

 #ifdef CONFIG_FUSE_IO_URING
diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
--- a/fs/fuse/notify.c
+++ b/fs/fuse/notify.c
@@ -190,7 +190,7 @@
                folio_offset =3D offset_in_folio(folio, pos);
                nr_bytes =3D min(num, folio_size(folio) - folio_offset);

-               err =3D fuse_copy_folio(cs, &folio, folio_offset, nr_bytes,=
 0);
+               err =3D fuse_copy_folio(cs, &folio, folio_offset, nr_bytes)=
;
                if (!folio_test_uptodate(folio) && !err && folio_offset =3D=
=3D 0 &&
                    (nr_bytes =3D=3D folio_size(folio) || file_size =3D=3D =
end)) {
                        folio_zero_segment(folio, nr_bytes, folio_size(foli=
o));

I'll prioritize sending this upstream this week.

>
> Defect B =E2=80=94 fuse_send_readpages() ignores descs[0].offset (fs/fuse=
/file.c):
> The readahead sender computes the FUSE_READ request start as
> folio_pos(ap->folios[0]), ignoring ap->descs[0].offset. If the first
> folio of a batch is prefix-partial, the kernel asks the server for
> data beginning at the folio start instead of the first invalid block.
> The reply is copied at the wrong position =E2=80=94 every byte of the bat=
ch is
> silently shifted. Both sibling paths handle this correctly:
> - writeback: folio_pos(folio) + offset (fuse_writepage_args_setup)
> - sync read: folio_pos(folio) + off (fuse_do_readfolio)
> The readahead path is the odd one out.
>
> Suggested fix (one line):
> - loff_t pos =3D folio_pos(ap->folios[0]);
> + loff_t pos =3D folio_pos(ap->folios[0]) + ap->descs[0].offset;
>
> Reachability today (why latent):
> Stock 7.2.2 cannot construct a partially-uptodate folio in FUSE =E2=80=94
> order-0 folios only, no code path clears per-block uptodate bits, and
> the VFS readahead core only hands freshly-allocated fully-non-uptodate
> folios to ->readahead(). Both defects activate exactly when the
> large-folio series lands or any sub-page invalidation semantics are
> introduced.
>

Even with large folios enabled, this isn't reachable since
page_cache_ra_unbounded() never adds an already-present folio to the
rac. Every folio that ->readahead() sees is freshly allocated / wholly
non-uptodate.

Large folios aren't enabled yet but a patch for that will be sent out
for inclusion in the next (7.4) merge, which would only land after the
above patch for the zeroing lands.

Thanks,
Joanne

[1] https://sashiko.dev/#/patchset/20260717032835.922433-1-lihaofeng%40kyli=
nos.cn
