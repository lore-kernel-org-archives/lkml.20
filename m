Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6787474255
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141079; cv=pass; b=dK3rDaynpRUFHq9iaQhZEZgEe+sSwiaD/jqsVufKy9mYbcZ57vQCpNBeiWWNNvQzYjC30d/7ZlEv5JNANOuFrvTBtTqtmlff/tVkufMO3tlqy3e7g8TY79yUpTctKbSPmzIdTTf2NLA17ruKcp7hTTMBK7D/iBdvXTP0wrSBwTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141079; c=relaxed/simple;
	bh=+PvUBu05+2YMlPHjfbtJA5IagWMaCmpnP8h1CMs7p6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ut0YsKbiW/o4A/kVOn3GOvhsIOiXQvjxV3DgXPM1Bu1FlCz88MI+OtxZ/5gnzAMyDTrNxMw/huWTobFiPMAoJxfTa/O3OVoVdtnoh/Tj0Q0fam/7RSl4jnFI6WlPTo5I8nL32y0pcZa/CWmOzGiIAsgDFwGhUpw8vdfYHd6U62c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lSZxiYcv; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lSZxiYcv"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d6ff390a6cso4115ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:37:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141077; cv=none;
        d=google.com; s=arc-20260327;
        b=RCa5EmAo5tQ6tY3QPEwsWwneZ18jVns1bA6vNIbaBx/umoIfFlQrvjqXsWwNtR1F/E
         mQZ3qkSs1/ZHciyETjIip+MG0D3l8C/ODXczeXhraHkCLD6px+qmXY0vmq7oYw9angwD
         zy1lFPHq9PlfM5FoUP3GAcvWNj01blpRHIT2ofU2cpt+sLqDBr/Ujl2Wq3O/+IoHHryh
         if8Sc7WdP0WvS3c2OwlL/WyrXiFscZpX8ebTYLQs+TUhWJL3ohCpxzyYts1uRn7FHVnV
         xmAr/dljIZ1wWwphatOF7hWAnXx7R23ZVo8h0VzQpUnu2nJDpiCgY99vBDfDmPRmo4qZ
         B0EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wsCIxhtGq5P1DGf/JLu9tT2TciWG+UAgFAPkzel97sQ=;
        fh=xWseMlmdasQGFPDxbyJbCznboMbUpebYaZQtDosNdMc=;
        b=QwE3hnYe6Ixbs9S90X7EWmDMiKYreROHqepD8WuQPwTX2xABiNUFaLdA82JQ6PlkZu
         +v8bYZT5JtQb3VN/1YhX/Isk9saihCOwRBz4/BcIv1gGZf3AWPzlfIDcJdWVSph/guDk
         AyJMjmHnIPlI2f2iRVl1jD2vy/R67ZkcvJZTzPLkMvXoZX2Uf6Y8/BVMzEorGw/0V4Ue
         7xR12tSIfA3ah2AIhh9e5xetle5HCr7Te28cEStyH1i73JrML6Fkiul1axVfIn3DBBY3
         j7sPXL5MODOozb/rQzYXe2tVgsdJ+yMEMyCEVppBoEz6F6Je7RENnXS0Rp1adYQB88+9
         lPwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789141077; x=1789745877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wsCIxhtGq5P1DGf/JLu9tT2TciWG+UAgFAPkzel97sQ=;
        b=lSZxiYcvvyDtF/F2rQuM0CjVXppnIiGxUJJb5oV8qd3/SV3eD1Y5dfieXbLD4deZ/g
         sQYDusdxdGglq6wPwyHBr01bQiB3Uey6mrcyhCDqHcoZ8IbclOFiHVMS7qwAvSRRi9Go
         tpiEVSPEuVuHVK+l1uFMLyTwwF4bflvuN9I2qspbu3zniFmwnCsjhaNCSAtR7HOR4wjZ
         PZGR4ttH9ofK8e+RzWYKU5Favf3KToVby3zY/sRXtZUtaAlzZpf0poJ6+5YJvrfglArU
         xuMSS8GJcTaJ62mD2CwrJN0h2qafV7/lzquULPFaigXQn9XJGzB3cYOGriYMTt0GgS/2
         lKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141077; x=1789745877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wsCIxhtGq5P1DGf/JLu9tT2TciWG+UAgFAPkzel97sQ=;
        b=Ll2gdgOFA0LQ2yNs0t1fwYtjsXSTCk1SR5+AxFWgzSDs5pRLKriwSPpoFRg5SPRDPP
         CagL8vybng0ZTekvmOJifqWAmuUn3hp+z9BotvkcHfE2M/QS2NEJ9bhmyEHGvRN6Rv88
         ROQOzybXWcGiNKadNFw/4eNCDxp2uCy+RAzZmIy5cFMV2DHIQZ9sHoeNFpdEux1kI4xn
         +0P6D8FxbHvqZUZnP8kRfrqBrlXnmWodyYFl+yHROT7TNI10uQ2TrAzISQKLOp4Hy4w5
         WR/9SZfZj43kJjqmO9GDv13dFzZnBjhbc5HRdYdHcCYniCNe0vnR9VljLNCga/ZAELNZ
         Dsdg==
X-Forwarded-Encrypted: i=1; AKwUvBxQFQRDIif9ZJZkg87NgUclyfm9LSWGUqAGPL+yhNlcXAqZdg6SEF53yOwEjiss7OFIycoU87Ea4h93moY=@vger.kernel.org
X-Gm-Message-State: AFuF++nv3/H/HsXXCq4QQHUcfmPWikbPgWehkWGReDwfVlP/PihDv2u1
	f+FH4lD7YJkUSK772kgW0rGqdZVJeytE+O27PaU/D+H4xk3Tt0op1ZbFiUb8hJmCQyZDhH+L2mm
	dodYqQkd7HWDMejQbeAuAi+22o0PQpvKi73VIw6yc+kj6+2M6Zfqbtf5Rk+A=
X-Gm-Gg: AYBFou1YGB+Y5MTcqhJMDF3RcKy0MayhRaXTjOP0J6v4QWrntZSOVcQ2/A5R1fliTNI
	JAWc5+ZjiSFg1b5MGODV8mm39AO7cZQ9j32KBWQcsVwCKfNTXpJEK0jFlntaTofl4qtOhR9WgIA
	7pSIJEP7D4q0uyS/RnxfbGHKrAlHkrJy9nVgMCKn7vOW7NjdkcX5cEjFavvAxEZpcW5FomDE5XF
	4JVGBQUWVnvoRASG7k+cPtn3IZSFtukmCThi82el+9L08zqa8MXAtwNrBfypBV93rL0UK2uprtG
	mw1gDL84zPTJ71HcimcKUzUBz6Mf+vOwGlx5/7pOObdrCRGMgnO1ZulWVDiIw0a8CbZI21K5vk8
	T9jYAOiZEm6GJXz9blJqQQSO1Q0wJffK5hVwBv6atTeEgWIKTites
X-Received: by 2002:a17:903:2450:b0:2d5:db3d:1a43 with SMTP id
 d9443c01a7336-2dd2ccad1dbmr7425785ad.16.1789141076474; Fri, 11 Sep 2026
 08:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
In-Reply-To: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 11 Sep 2026 17:37:19 +0200
X-Gm-Features: AcwNN1VKgf4fw_Ks11JTx3jlILU5s45x6YRkDDYmuZ_v7ulwv1aK31yKugsCtS8
Message-ID: <CAG48ez3vVAnqjmzDxQZnkhHkw4yyHFzKwNT-2N7veG-mmpfMXw@mail.gmail.com>
Subject: Re: [PATCH] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array slot
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dominik Maier <dmnk+artist@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 5:35=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> A cqe32 entry spans two CQ array slots, so the last CQ array slot can't
> contain a cqe32 entry. If the CQ tail points at the last CQ array slot an=
d
> the kernel wants to write a cqe32 entry, it uses io_fill_nop_cqe() to pad
> the last CQ array slot with a dummy entry and make the tail wrap around.
>
> However, malicious userspace can directly set IORING_CQE_F_32 on the last
> CQ array slot, causing __io_uring_show_fdinfo() to read the second cqe32
> half from beyond the CQ array. Change __io_uring_show_fdinfo() to
> explicitly ignore the IORING_CQE_F_32 flag in this case.

Here is the testcase I used to experiment with this:

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <linux/io_uring.h>

int main(void) {
  const int cq_entries =3D 16;
  struct io_uring_params params =3D {
    .cq_entries =3D cq_entries,
    .flags =3D IORING_SETUP_NO_SQARRAY|IORING_SETUP_CQSIZE
  };
  int uring_fd =3D syscall(__NR_io_uring_setup, /*entries=3D*/1, &params);
  char *mmap_region =3D mmap(NULL, 0x1000, PROT_READ|PROT_WRITE,
MAP_SHARED, uring_fd, IORING_OFF_SQ_RING);

  *(unsigned int *)(mmap_region + params.cq_off.tail) =3D cq_entries;
  struct io_uring_cqe *cqes =3D (struct io_uring_cqe *)(mmap_region +
params.cq_off.cqes);
  for (int i=3D1; i<cq_entries; i+=3D2)
    cqes[i].flags =3D IORING_CQE_F_32;

  char cmd[1000];
  sprintf(cmd, "cat /proc/$PPID/fdinfo/%d", uring_fd);
  system(cmd);
}


With the fix applied, it prints the CQEs as follows (note that the
last line has flags 0x8000 but no extra1/extra2):

    0: user_data:0, res:0, flags:0
    1: user_data:0, res:0, flags:8000, extra1:0, extra2:0
    3: user_data:0, res:0, flags:8000, extra1:0, extra2:0
    5: user_data:0, res:0, flags:8000, extra1:0, extra2:0
    7: user_data:0, res:0, flags:8000, extra1:0, extra2:0
    9: user_data:0, res:0, flags:8000, extra1:0, extra2:0
   11: user_data:0, res:0, flags:8000, extra1:0, extra2:0
   13: user_data:0, res:0, flags:8000, extra1:0, extra2:0
   15: user_data:0, res:0, flags:8000
