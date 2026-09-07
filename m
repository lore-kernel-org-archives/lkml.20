Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D697F367295
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808530; cv=pass; b=n9VgFcn/utpJtDeUDQQj2OTBwsB8IZZ/II5r7OPhNnAF9R9wFENZ2AZVqGKpvEpeA0gzqKRbr/ouL35maGYf59ULSdH+aQOXK3oQef6ULk7AAqaSebYjPKPlE6bIf67v1gfhW4pO386VlTNDr4K2lJD8ycFaGSiK8mRsbRBBi5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808530; c=relaxed/simple;
	bh=x5vPF2zdApbc1bQDHCY5MbAFgU4op6PaAJerhpeqC0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XsfnK1R3rcWoyvGC/lUFPSdIg7iAsgi0Xcchxcrm8CoyTQxKhKXs06k+43vY0hvFI6wGN9Y62rEthP3oQvvnO737EPv3WQD1JTdUWg/r/fBu+kY0I3U4wrb7GfijFmjPzKUMW3d1UdjK+KCotBVS3ei+aPZAbccJfbfESaqp4hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=cutZm4vn; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="cutZm4vn"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c252e703fa3so585421066b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788808527; cv=none;
        d=google.com; s=arc-20260327;
        b=LKOcBMBdXv2UZqDBihSA3LAT9O0UxG/BuYHx7OPVDvtiOl5veecRMqoBUXqGMjvIg9
         FP+uthX3s4wtOUSEFkm5mBsHDV+CktulOLQYm6iqUdF6nDT9C2fm9sAxWP6Q1yF7ZqRt
         5dDNsAyUdt5KqHEbptqo99vPKb0p83Hs4cSm47CvxoBjUWaFOt5eCeyLf0RTIgZASHhF
         zLrpFJTDYsJ9rtG6qtGW1piz5Yq+cqzu3vh5NdnxBLsm7VVE6icEcxUJ8UyevfNqp5aV
         F92S9mkHiDJOs2MKcr4diO5JC+xWrKtbheyA62gwd62VEKUVOHJnajQ/jkhVNGOPqugG
         rAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YLZ2agjLMgvlPAn6cdRVBCiOCyjFQG2uOoEUzkcYPBU=;
        fh=0RxRxG5aUyHJMGblBPc6+w3IDV9IEMOSi7+KVXcww58=;
        b=ndcdrB5MG7K3ZbRUXQW8r6Ty/y7b10+AGr6VVYHy/Kx/NgQxSEiyaF/BTNPfuuC0Io
         0+ulsUhnfjm4ymCyPvSgr82Z6jDasJmi4y1pXNRtHuVyndtM68ry7//5yT0xbUZCDacl
         xVYy4ZmEC4ciydHvb0BUPn5LkpJNKrKmOYMCeYtwI3mtQWc7xzB2SI06plAaTZpWVN2R
         4aY+nD5k2v6sXk5YCyuT9xcwlu3YD3Flv4d6flWC9E5J8V/R4ihTq+qT4WipPKiPj6g9
         IwOxT4V42s4VdNo46yxUroIixKGa7yvOGC2U8IgaK+TWTe4PUYeFJWN2mzgfp2IYyA0f
         XP1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1788808527; x=1789413327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YLZ2agjLMgvlPAn6cdRVBCiOCyjFQG2uOoEUzkcYPBU=;
        b=cutZm4vn5t2JZOR9OMgI6pnmqYqQFfvcFwC63fGWUTWiVKer5VjKXFZo8dC1DLyJgA
         JeaS+sEUqPRQeejiN6VA+HRNH5InkI62g5gY6mmT4CmtIqHG3xgxoXiVxzJrA8AfN0/X
         /abBW0tO2dEig72VExEuxJTYAu5kRqLLxm8i6HRQ+0VTirB8F8uoubAZj67hfsLNw96O
         BBkaCVu3HHgzHYwxIfgyb4hT1cNZpUfVBzhzLcCIKbkSzu9yi6m3fqa158hrCnkcD+6d
         LxrtoCmbP+P21eFmt622XvDz5NLoRzP5zQTG0Ie8ErhkuFy5FGiCglCwIO/NXF6EPF8Q
         AhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788808527; x=1789413327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLZ2agjLMgvlPAn6cdRVBCiOCyjFQG2uOoEUzkcYPBU=;
        b=V+huRTRAVe4zz8varJLbWfuGq73AcbSNVLe05YUAWAe2hxTepG/yz19NRrtfq9tEzV
         HVaxmLli1DPUtQoGJfLmIA/WfCLavqDa9CQTXksNx3AhLq4190XqBtCsKgV3st2UXpCS
         Idg0uTayDlG0qGpnpmm0BBHcKjkReC2NYlJVL9W//m+g6XpoWyDQX1w+aBmgoecDXAut
         1b4r3HQE5BL3wgujKKP1jGp3j8WqrRtNw1vU103hiQU/0pApI7jOe03/1njTMy/A2jnv
         mUTJAhPPwHDWJEwPYPgZytYydawmAxy97HMWC8Od1tFV4VybfRr+MucOjWtYuFgScn2c
         rbQA==
X-Forwarded-Encrypted: i=1; AKwUvBz3M3Z6XvZf6oDbo5tLl3miR0ILWahcNUxIowK+CFq8YbQ+AgCz4hmU7E3/DALMmXblJTvOWzVIj6oeCnc=@vger.kernel.org
X-Gm-Message-State: AFuF++k95d8NEvET3FQETJdOOY9Om+sFl+Vk0piZm2JhAIKAqH9YG7eT
	hjrjYVezSu4s6VoJlUKVX5U1FPuRHSwN207r+cJpESXOT+4g2FA7HsyvW1Y+pYkZIO2FCIhotnt
	syAPbYgXRjJokEuU4MWo3/4bXdvnbh7O/jA7DAJ83Yw==
X-Gm-Gg: AYBFou0L/PzNIMjJ4suxk+93/ofARnCbIyWpu3RUsVWMGCq+hRtmj+KiOud1hIQUIjy
	erPPoWva1vsi+zo70aUJS9crELA01DpU9pjALrkkYYajB23YCnvQ0xZHkYnyZ3dlN6KYB1xmQlo
	9sW0KI30/aL7VorAjcBLjzYojQjkoS5ygfli6jpUy7g2Z3q+oFjCklUkV8k/QMHd9JYzzkrIW5h
	DC/VFrb0/kobsp4Ezkw6PrANYvjFjglK/fGT1q7PIF1wz1oxCo68+w1m3o8PwOzFYPQIxLZMcfW
	lO8Va8gE6U0Ed7Rxh2TJn2MMDrQb3pH9bUKs7lmJCXSD+xNxray904vnUwqMp3NpPy+mhfPLkb3
	2cnRLa/dj
X-Received: by 2002:a17:907:c20d:b0:c25:23d:5295 with SMTP id
 a640c23a62f3a-c260c9f8920mr994472866b.17.1788808527122; Mon, 07 Sep 2026
 12:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904150304.49104-1-max.kellermann@ionos.com>
 <20260904150304.49104-4-max.kellermann@ionos.com> <CAOJNxRKxO3z3H0xXG0J0W9_hp2qwBfFEUeKFGFnk_MRQtu--tA@mail.gmail.com>
In-Reply-To: <CAOJNxRKxO3z3H0xXG0J0W9_hp2qwBfFEUeKFGFnk_MRQtu--tA@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 7 Sep 2026 21:15:15 +0200
X-Gm-Features: AcwNN1VSJfSMfCn3vuBaXzqEcc2QZfWjSUijicTPAmQje5KrNhk1pl3uBSLDJng
Message-ID: <CAKPOu+-zixbekaeE3+96hV+abQxnEAnTQnFJwhgPeNa7__6irw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] ceph: don't unregister an MDS session before
 removing its caps
To: Xiubo Li <xiubo.li@clyso.com>
Cc: idryomov@gmail.com, amarkuze@redhat.com, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 3:56=E2=80=AFAM Xiubo Li <xiubo.li@clyso.com> wrote:
> Just one remaining teardown path still unregisters the session before
> removing its caps: the fallback loop in ceph_mdsc_close_sessions():
>
> mutex_lock(&mdsc->mutex);
> for (i =3D 0; i < mdsc->max_sessions; i++) {
>         if (mdsc->sessions[i]) {
>                 session =3D ceph_get_mds_session(mdsc->sessions[i]);
>                 __unregister_session(mdsc, session);
>                 mutex_unlock(&mdsc->mutex);
>                 mutex_lock(&session->s_mutex);
>                 remove_session_caps(session);
>                 mutex_unlock(&session->s_mutex);
>                 ...
>
> The rest of this series consistently changes the ordering to keep the
> rank occupied until remove_session_caps() has completed. Is the
> ordering in ceph_mdsc_close_sessions() intentionally excluded?
>
> This path is not limited to shutdown: it is also reached from the
> corrupt snap-trace handling in ceph_handle_caps(), ceph_handle_reply()
> and handle_snap(). In those cases mdsc->stopping may be false and the
> mount need not be in CEPH_MOUNT_FENCE_IO, so a concurrent
> __do_request() can register a new session for the rank in the window
> between __unregister_session() and remove_session_caps().

I don't think that's true for the call paths you mentioned. They call
ceph_mdsc_close_sessions() only after ceph_update_snap_trace() has
failed, and on failure, that function always sets CEPH_MOUNT_FENCE_IO,
which prevents creating a new session.

The only other callers are ceph_put_super() and the mount-failure path
in ceph_get_tree(), where this is not relevant (no requests exist).

Am I missing something?

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
