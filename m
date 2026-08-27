Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E4537268C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861134; cv=pass; b=AUoE4db2W9QHKqF+iTZQIbOZ70mK8SUwqSubZ/t17OLe6ktTfkNqTw5YNl/ONvl23HH00jYXnSuGO7VB1ggKx7JqbGf60NYiHPZSaCN8ugiZ2JvP4Aimmr/OMTyV0v/ToC0JrYlwiypE6lhWO97XV8VmpuBQs59QdcUWWFo0PW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861134; c=relaxed/simple;
	bh=Amq2Nq7g4Rvhi+A8MmnZy28GeuV84bebu12tbajvslg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkR/30dY4eFJpeVS7RHh7Oce7KkRzlaEzcl0Omv+B6mmrKcJ2E5aIPjxlgwIUCVV/SQS+gDKDBDD6snp/a9CAj5VUxNd/+q1vaqUk9VEvbKC9dmKgwSGZaCueT33aPDdGiIFHZTsuuwJ3Ln09R9qd0f0IM+Q2qBiMUbF1jvghII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBTcaEmd; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBTcaEmd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so1178045e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787861128; cv=none;
        d=google.com; s=arc-20260327;
        b=Uw94fMS2NNGrpqrx6ZhZ27K9a6YSod7+Nl7qqypow9stQ+lHsuuE2zSGgh8nIQFAwT
         zLW+BTZllKrxeHCn80FXDugBmdpzMtr4Af+sqrW2NQWbRrWDhDW8xxp54IyStPpzXl7j
         bAaD0pWCDFkzDwguBoeFb4bUPrpCJHrvRbJxxdi4sYF6ckvKMSrRWEIhjzzIBHWORYA2
         mnWokmhtD/y8XvHUto8hxiV9BPy5CMNRAtBNNjbSxfFhvNmaMRJky9lb8MAxYvIuUT/y
         8rzbDdP0njd0jM5wnvrGeLnnxIEeS5oHhQk9uo4Vf3Dm3qMVJQZmaEmE9iFJ4G0cmfIl
         X8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BIsnd6xgeWrgcQT3jCCMdd8DVWxNR+Gr3QkvZG2o5wQ=;
        fh=7M7jS4GFeqDX3nkcoMAZ3+igsAn6G4qpXVF8Vs4MY8s=;
        b=doFMWvNz/BOXyfmbe54lOXda1TZmL9sQbp8XE65SHhICqEUfSMl3xH9HC9E5CwLv3W
         qoeH/8XsjqZvov2zXXR/+wLoNn5UxGeWxMRj6/Thur9jVQLn5AJ/r2LHxfapjX0UQhil
         b75xhCGL4yJ/zd5aK/NiWi9NyrVgiKtTxuMYLj7+ihGzKoU6XuS6CbI7deM78Hburh7i
         ixgJU9J9QsHb2Arub58/j6fZQNAsLWwslyeqhDayWPYJ0xOvXepOtB21z7HtZ20LhObD
         fGdYhVlyuO5dAYt/y0baCV0QGR0yRWwh3fpuc6fmF2l6FY3yjSIEVZMWhFr2twQtQgov
         BtgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861128; x=1788465928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BIsnd6xgeWrgcQT3jCCMdd8DVWxNR+Gr3QkvZG2o5wQ=;
        b=jBTcaEmdwdW1DRedprV3w9bCe6/SEJs/DHjsy+D+PHot4C/PbHh5tD3BM6AzYCRCi6
         pWnhe7FihJi7qfBJNS+BVYisD9dMsX12faXTjzTw/9IRGDEtAaH35EU+ihqp2Uu33ynq
         uhZIwC3LG35wBKRoLsXUPWgEl4QAOtGU46rOl9i566IVSK9phMB5SNzdSqaXtnnPIoqQ
         H9sy42ymjOdy+f63Je0waSafi6q1BeCdb6uW23+Y+Sv6XzOv32pHLYs+qlaK6knAMBza
         CkfyYJEVtbS/VyPG1h9ao2I1/CL4JxF13UInCu9/qA+jqeRjk3uNvG3ELapCPsDwbqta
         iJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861128; x=1788465928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIsnd6xgeWrgcQT3jCCMdd8DVWxNR+Gr3QkvZG2o5wQ=;
        b=cbwNXdSCOkBrPgbj2V+i7VGeHO6/EhmftKBGURXKpca+LSeru6Ix1EIKKWOyXpt+ae
         10MBrxYcZP9KUjeQ4aKaKE3SmEeKT1fHRuROVjjevo0bcLUF1DTOxrMxFy9CylD6EzN4
         hFDoXWD+YLO8odQL5/DqVrnCDAVL93EoD+5yq8bHMIJjbTxVsYVe/nSUfCDFwy6fm53K
         cVeJ7Y/Ya6Xr3JJ1Q2LX4vjHMbnBqHUzgAR9+FFSRPDKcJqnjb237AhFMSzkJFAvqTQO
         VBYxwKfBoeHtqqyvV8+800XWUyoVn3pl0j2C/kg6pVxjXzwEcJS4Uw0MnMHtYhyGJy6G
         t0dw==
X-Forwarded-Encrypted: i=1; AHgh+RoFvNtMTQEu2awO68VKMOBpCmsYkBuS31ewhAPFX96KS+dZ7tMTeDxC1NNl52p3doSde2dPCY5sqs57QFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mDJaDGD4nFtrb1aAoa/GqiDJ8cswOgwhWroWhwS2eFaLOdeFx5
	uGZi7Fq/dYYKdwPHugzd/xmMgpx2RCZ2zM6dp4vBq7dRr+t7dr0f0qUo8iIHkgMN8O+XOYLnh07
	ymJ3ZgyeiolA/GOJbdotnEVhhGX8nSEw=
X-Gm-Gg: AR+sD11LElAEp+MI8NED1qU7sjqhW+o9IBbACniW7hj9weIjG8dLArHik9blEZOBoTS
	05qnuKqJj4SfQdr4OgSY3EAAJ7sLblp7hELCvoL4dyipXVlorY6z2RVwl54TG8pH0ba82WKatH7
	xAE87avBrpolflb2K9MBE7J2Nnm6IEUiLJKU6nJaBzeQbsIRf3FVvgyTNJUFk+L0ratGYAOPeG6
	N2u75B8DgkDNTURuYuETvy2mgRhYbQnJ+L/XYR7Ycn1A77QubqHsXyCb5Ham4HZNHB6thj6gZOY
	PxKkB34I8UPG5dbGTxoGhFqhE1zXKVkBxIbbvJlMLpmsUJGvrOGWdNn0pnm0Jz56l2BaWE7njts
	GpyDiBwEDZ7WRvtZoQy75ZecBJXE=
X-Received: by 2002:a05:600c:c4aa:b0:499:d513:e507 with SMTP id
 5b1f17b1804b1-49b91c17d72mr16962265e9.2.1787861127504; Thu, 27 Aug 2026
 13:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827185722.3234622-1-csander@purestorage.com> <20260827185722.3234622-2-csander@purestorage.com>
In-Reply-To: <20260827185722.3234622-2-csander@purestorage.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 27 Aug 2026 13:05:15 -0700
X-Gm-Features: AcwNN1UExlY2vL2SpJh0tNQapsYMiZcr3z5sWaZZFYGrbWrJd63x35h50FR6wzE
Message-ID: <CAJnrk1YfTg-Lz+TmM+c=Asc8N4QGuY9_g8zUXtaNr4O7hG1Djw@mail.gmail.com>
Subject: Re: [PATCH 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Ming Lei <tom.leiming@gmail.com>, 
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, linux-block@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, fuse-devel@lists.linux.dev, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Caleb,

On Thu, Aug 27, 2026 at 11:57=E2=80=AFAM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> In preparation for setting the io_uring NVMe passthru CQE results from
> the blk-mq request completion rather than the task work callback, split
> out functions io_uring_cmd_set_res{,32}() from io_uring_cmd_done{,32}().
> This allows io_uring_cmd_done{,32}() and __io_uring_cmd_done() to be
> consolidated into a single CQE-size-agnostic function with 3 fewer
> arguments than __io_uring_cmd_done().
>

The conversion looks logically correct to me but the interface feels a
bit annoying / fragile on the caller side.

Is there a way nvme can get what it needs without changing the other
callers? Would it work to just keep the existing
io_uring_cmd_done{,32}() as is and add a separate API for special
callers like nvme, eg:

  void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 res2);
  void __io_uring_cmd_done(struct io_uring_cmd *cmd, unsigned issue_flags);

where io_uring_cmd_done{,32} would then just be inline wrappers over
those? afaict, then only the nvme callsite would have to change and
fuse, btrfs, block, ublk, and scsi_bsg could just stay as is. Do you
think something like that makes sense to do?

Thanks,
Joanne
