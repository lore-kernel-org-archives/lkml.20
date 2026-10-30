Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793363647;
	b=RPb8qboJ3PlK4kngwcnJe/JFOf0+R5jUBKPkKjqV+wKFy/6wNvM10SRyZmNZQOZEAdx7
	 dxUFdQLXxJFbgkSnEHEiNJr+dAxQuOK/BOKhsP6Ss7x7GsGuoCY9D5jmZmzTgnF+tW3Yl
	 FT6pD0YflKoyl09ioRx7fxGnwylk4EK0mjkXEG3SuXyBm3Rp8u0cuD0fNV/Kg0OA30Vkq
	 mQcJbtkop27j5xI8M3ELIz/e06xvlz+PlaIImMhOs0QHvWQLrSZwz5gZvSk4SY98wryta
	 DkxOyf+yiDtxRWKVnevBfXz1gpc+Au4Lu2B8h+lxUe1tKQkSqnutytROHGX+P+XCJpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WhO2XispuG63y6vI8Up/ST3FM6vVbr7Lmjvw9Ig2I+g=;
	b=gFmT+ljberWlaymbJUBxlaCaWgzGK0az7JCtUguGj03RkneDPzg8ExdZmWvPRIH8rFuX
	 AcxOHG6G6iAGLwQIY4HBwFupeOw19sB4juSFfW2irilCT5SKE8UgZw7A0iJ3uaRsMzXYp
	 csaN1L2oZPWuslkPCfwiC/+B3TR4LQOeNqNs+MBi0cfga2TtW2D95yoLQfFbixAi9CQYO
	 NeiOwP/GkA2oRBLQnDOjmRqsLpxEIjPu/DRdUqWSFlLdgO0jmg5bRtzj6S1CRcLzWWNZq
	 W6EljqZI4nhA44t3GSB4P1hEppZx0jF0tWKoPbS5w2p8rNkErH0eBPBQMht8eEeuRvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=3x3Wo88M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE02D606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE02D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=3x3Wo88M
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c445c95d553so82353966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793363645; cv=none;
        d=google.com; s=arc-20260327;
        b=NeOENbMzERr/amhqiF3V5cMFEu08d26utEPkFz9046eNWH/63t2iHmSL/GnAyzn+3w
         1B9woMRDQ4OpBwW/0qMK45uNhqcBGSUXA6fKeZr6BTqOPJloVMdQ2fljLkJPnBj+pHYw
         e+qh/J7ElnNBVYbB0kgkUxNEKI278MewxQIv3gnICGZ5fRf4SeKOA3Nzw5Y8QCpb0Fg+
         1dxgsvVLLTo+oJCPVBa4cCBUsqIj090XXGBt9g4irODxJNsnkz74jO5aglH+qvZhwfEL
         wj3M+Sz85TiL3vGNJv0de6i6QCygZUwHQCJpxt4nY7pKoZ5I+Rpqoqfvg21zCeO52BB8
         vvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WhO2XispuG63y6vI8Up/ST3FM6vVbr7Lmjvw9Ig2I+g=;
        fh=zH2BH1aU6O2df7nb4U1GTJ0eltUZy6m8UayT7lHCcy8=;
        b=lGhgNL4s8EEvrOGli842LvLZe5cOHZAHSTC3fzScqV+WLhUR9fY3mULDz2ROprH7Xn
         PB9AQzEubNeORwJ0SPp9JLXYTS2gRCdihbIQFRsLTDb9qNedMuH/lRNpKigzU0lOSq7j
         +TXw0J/vKQ8NLhoWo9wmXpgjAGqrL2VOeYJjSnPHpMbhoRAWYdzIPDnL4T02eMkPJR//
         Z89NtRDp+0RclvNOhcUxHJXlWTC6t/IfNYG+BZaPloPf/ku+kwdGg86iHKOHgGtCGQbB
         J5mrMcjH7LQM+HXsyv9MkEiHX/RVit/KAwHD/TPfuf4UI4yX+4zKqaXIXfOB4BR6tuvE
         vNWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793363645; x=1793968445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WhO2XispuG63y6vI8Up/ST3FM6vVbr7Lmjvw9Ig2I+g=;
        b=3x3Wo88MBsPiYHKjXR9VEC1SiuizJdgLxy1RcgaUT98mgU/ljHgXh7qbrN4bIq7uD+
         ULsn5wWjBk+O6QwdX9ikQvdX7xsnioEc3b5hC0LEx3ERlVsYZ4+8z30zSo7Q/gXILQiO
         eyNv0D+/ctiouJd/siqi9lbQYZ/+S4APrMCr/c/F94bNeYLNbLfSno7XxlKfgEhvlAp9
         2MvlSvGV44mgZC73iWWOv2xapEHXXANTBD58E+QI4YI5qL7gSJtmvFNpK5DrtF4nts3k
         OqTGMfX2HQOVFfeBkS6fmBDW8Pw6RrJXwHaZfqTkLAJDYfEEsb3+enN2+gX4vFH83DL9
         FpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363645; x=1793968445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WhO2XispuG63y6vI8Up/ST3FM6vVbr7Lmjvw9Ig2I+g=;
        b=0rCmmY58rAN6uJNDfUcTcA6wikryEvRfhSvjgLrEf9kc/9CuyAdq8pWJ9b0d+28I/j
         kmOaNuBYqgj0CZbHksmwdf51hDghwpl0g+dQ6vqu62cgf4ayTVKJxuU86da5BQ3MDbYb
         2W6TeSO6tWN+U3fYPvGxv5OdeD/joBt2d55SPAax257yplhW3+X1FOV1c6zXYL/aU/5E
         q76LncyAlmYM/hRvW/QQ9N+V/b7ZLAwfj4p7u6hEnsKYu7SDndL53u84ITD0YqryBN5V
         I8V8VWaPayQwBOxWjtWcaHzr0DYT4od7PvxFeuXjbXftF/Oyu3mgQ2ndHKnHAs7FF6An
         QgGA==
X-Forwarded-Encrypted: i=1; AKwUvBxvUgluTMJBsCM7f8zteXcUuAsV9xmE6YAKg/83tPu9y4u4ozjf9wHQ4uAGwcUOqtvvORSRQsq7KPuaPu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGOPIJ8Bv3UDljJ2/Wlw8FuUWeAKBrexaHJYJlBAQH6Jr6vE30
	Ol7eh6Cd65vDVxfS/h4WtdFIqfFMTtFpJKURNU7ojrz9OdCkWmGFkBY64BKAwQfVuMxBoZVcdKP
	ZTiQGREMUe66/vkzBdn2FrQUTWeRxTmlFlUrrx8NRCkcahTaQhvQ9xRS29bBD
X-Gm-Gg: AYBFou3edV3mGm2PUclEw/dPJc8U+hJn7n/MoBnkLCoEAKghEbiOk9UC15debk+yGTm
	9f0WOJP85F1ra0O4GY9QmFCMwVy/iNA/7bplTG0sIk/6+8qySBRzzqWHEhUeSFH76NYw01nVX31
	L0ySEJD4eQgwFZupSOalH/PZDTeMdS9Gv2OQL6vxYvIKA0UthlHCnJxznZeJ7nbS80cZTU4oY2w
	g8awuwqMMQW8YWgpsSlysv8m32OdJsgV3sr7zVoh50QAS7rmhEt88YzBY2RXSshBEd5v6A+749z
	91tHt3nLv2LHUuaf4zGa1ocUSOthZx2XdwR3XuPcnoxgBeLQPkBRcry2sqPNyRcKnSVXpkFvuJv
	IZJxYW4OlYjqEHsd0z2OhrZ4qEAqO9IlvvDr+IUliDXBdKkx2NiGPEFQke7zIBFflOvRSJg==
X-Received: by 2002:a17:907:60c8:b0:c49:a4b1:9cb1 with SMTP id
 a640c23a62f3a-c4ca795fa50mr235275666b.3.1793363645151; Fri, 30 Oct 2026
 05:34:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-biwin-tua-quirk-v2-1-4d71af956ac5@flipper.net> <e9ada0a2-aa36-4cde-a7b7-5d4693d372ae@acm.org>
In-Reply-To: <e9ada0a2-aa36-4cde-a7b7-5d4693d372ae@acm.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 30 Oct 2026 16:33:57 +0400
X-Gm-Features: AclHuK8mCiMIJSS5TVbq3bssLQ6wBY5LSL7g722rlXFx8SMXsDwvAIAeegWVCKo
Message-ID: <CAKTNdwGqaTMLK7KYcdayDUuJi8NnA3rR9faqMa5CF1aOOiaY7A@mail.gmail.com>
Subject: Re: [PATCH v2] scsi: core: Clear power-on UNIT ATTENTION on BIWIN UFS devices
To: Bart Van Assche <bvanassche@acm.org>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 9:20=E2=80=AFPM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> On 10/29/26 3:41 AM, Alexey Charkov wrote:
> > The SCSI core retries a command that receives a UNIT ATTENTION and reli=
es
> > on the device to clear the condition once reported. The BIWIN
> > BWU2A0526B128G and BWU2A0516B064G UFS devices do not clear a power on o=
r
> > reset UNIT ATTENTION when reporting it to a WRITE. After a device reset=
,
> > such as on resume with the UFS link off or in UFS error recovery, write=
s
> > then fail on every retry for the full 180s retry window and end in I/O
> > errors. A TEST UNIT READY or READ clears it.
>
> Does the attached untested patch help?

Hi Bart,

Thanks a lot for this! I've tested it on five boards: three with BIWIN
UFS (BWU2A0526B128G x2, BWU2A0516B064G) and two with FORESEE C2G071,
on next-20261027. Tests: UFS error-handler resets under light writes
and under fio keeping 128 direct writes outstanding, runtime PM with a
WRITE as the first command after resume, and suspend to RAM.

The core idea works well: on the BIWIN devices the TEST UNIT READY
from the error handler clears the stuck UNIT ATTENTION about 50ms
after the reset, with no I/O errors, including the saturated-queue
case that broke my v2. Since the EH commands reuse the failed
command's tag, they don't need a scheduler tag. The FORESEE devices
never enter the error handler.

I did run into one regression though. The new scsi_noretry_cmd() check
in scsi_io_completion_action() is reachable for a UNIT ATTENTION on
data commands, since blk_stat stays BLK_STS_OK for them and the "Kill
remainder" path doesn't catch them. So a REQ_FAILFAST_DEV command that
happens to be the first to see a reset UA now fails instead of being
retried, on any device. I confirmed this by issuing a readahead during
a UFS reset: with your patch it failed with "I/O error ... flags
0x84700" in all 20 runs, on both the BIWIN and the FORESEE devices,
while without it the READ was retried and succeeded. With md
raid1/raid10 failfast this would mark a healthy member faulty after a
bus reset.

Dropping that term fixes it:

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -849,9 +849,8 @@ static void scsi_io_completion_action(struct
scsi_cmnd *cmd, int result)
  */
  cmd->device->changed =3D 1;
  action =3D ACTION_FAIL;
- } else if (scsi_noretry_cmd(cmd) ||
-   (cmd->allowed !=3D SCSI_CMD_RETRIES_NO_LIMIT &&
-    cmd->retries > max(cmd->allowed, 3))) {
+ } else if (cmd->allowed !=3D SCSI_CMD_RETRIES_NO_LIMIT &&
+   cmd->retries > max(cmd->allowed, 3)) {
  action =3D ACTION_FAIL;
  } else {
  /* Must have been a power glitch, or a

With it, all readaheads in the same test (25 runs) were retried and
succeeded, and the error-handler, runtime PM and suspend tests above
passed on all five boards.

This keeps failfast commands on today's behaviour for UNIT ATTENTION,
so failfast WRITEs to a device like the BIWIN ones still go through
the old uncounted retry loop. Sending them through the new path as
well (dropping the scsi_noretry_cmd() exclusion in scsi_check_sense()
too) works, but then scsi_eh_flush_done_q() needs to count their EH
rounds, or a target that never clears the UA keeps them cycling
through EH with LU resets until the runtime limit. That seemed like
more than this fix needs: I'm not aware of anyone running md failfast
on UFS, and readahead is a READ, which clears the UA on these devices
anyway.

With that change:
Tested-by: Alexey Charkov <alchark@flipper.net>

Small nit: the BIWIN parts don't only clear the UA on TEST UNIT READY:
READ and SYNCHRONIZE CACHE clear it too. It's WRITE that doesn't.

Best regards,
Alexey
