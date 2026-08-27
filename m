Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D0836074F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787867072; cv=pass; b=pOXDMb+WmT5qCsAKvON450wNelze9O6h0d0zdFtJLGqhvPoRxYadLyJxpRqiYOqjWDI0VVdGpD+70RB9GBlg6BhU5+/OBhRL986tl+0Fy34lUGBxAxaQY0ANxjXHLDlD3nvffyaUPVVPxdkWJaBPZf2MhvOyDLC46cFLO8hx08w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787867072; c=relaxed/simple;
	bh=0sBuqucNWMJ3PQ7mkm0GStLfwt7hAbIgMaO5tBFyaUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E23NQOYbajELZfTsc0EzNWutOHGqDiRfOPoO8W/6XuJw0lRL8/Jm/k1ID2eQA+ksKgixrWCYBj8TSlO72yN9wvhgBKGlWLfaKddtaxS5M1+v5dLEKdI+giIsv+klgGaHkqS1eKu25/NUH/wLo6n5yGCLxBc8LzMcp6HG9WsGcT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ZTrSBDI+; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ZTrSBDI+"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-45ef92f7cdeso121486fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787867069; cv=none;
        d=google.com; s=arc-20260327;
        b=kHiwQ6ijTiDpwEIY64aMKUL89MnyGlfou4uk76yspr34UzFlsb5nLuey2V3Pu/1EnP
         NkhoMwmfwMI2gWC0tSyP9w4mafz3Q4Dc1gjWaegMHlDneYGxFMp1cuoiGD1oMLdZAstY
         tt+WUBNnQFwAaHz5ZVqjwJP5YagQIowYWj4DgYLexdJa5TmugFxJ9EZY3uf593s/4o31
         kRdFjvksOxycFc1XxyeRbe58PoVNYY02zxVVZuiakH3G0K0SnmhPkCK/LCP3gtEZhIoY
         2th95WwrY157PTl+xss63obFGFrEmnoucgukSWwis4mrBk8+SGE37+XHwqeOlpXnojt+
         naYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kqBamkmhnxpQu01OYVCgjjVqjgGXsL5/W693jooZv34=;
        fh=srya4o3EawYSkhvwFWAehWLqazJdyDQJ6U3FnogH46s=;
        b=K/5MwgVmdKhpqsFNMExC0SvBKE1QlTTvSBvlw4zB9enBhAJ1qJF3FrwiaLxcY91UC/
         9S4ddJHVuv0VQJPsm0KP/oCKppz/SnM7HygmHjz/B8l4cnf7DlddrKi47whDv/CWQs9j
         c8goZ6GuNn4TUcHy0L+3qZCgT8huvT3OJNrz97VwbX0zDUCbucgrpIQD9Phfy2H2aQex
         k0zMMdL5ixUfDVhl228hyP+rHPro0gpR4dekmTBSxt9lhfFbBi3lfBbJY/IWp2ETjhRH
         NjnvEsxQxkxDcRa25Q/UMMTisnH95Bui3VeTVE6UKj3VVKaKdBqvDrzJM7/xtLJ9jst5
         LJww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1787867069; x=1788471869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kqBamkmhnxpQu01OYVCgjjVqjgGXsL5/W693jooZv34=;
        b=ZTrSBDI+mPv6N+9HPOoOcSbhmUkUBhPzXdGsbf4IcAnGI0Glqh1gi6UK5sJn1/UOuI
         5WmYrDNdNGftOFB6sL0MsoG/GkrMAQOqk/tokMVid4ixJn1zODd/o8mkwRCF+4s5Mx7n
         hzC5Rcnw9GFjAl5mx4JAznYgPZlfoPtUtQefmpUgYVySl+64X0J9WDaZpDg1K40kLxFw
         dRzkW1d/qKFjpgUkbllKjyQtj5tGs943l6r+mg6H+DoHnElbM1F3AcDi9+ZLC8pX+3hg
         PbdqhPbq9qlvZ9qS4MO7t8+5PpUTFYv7xwC7k48XRi0qLhUD2tMajDDlzIUqlsjJ9Bdx
         NVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787867069; x=1788471869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqBamkmhnxpQu01OYVCgjjVqjgGXsL5/W693jooZv34=;
        b=YYc4Q7nVJKz4euA9Qs8FLXFKf1OnAStYlwu6WGLo+A1BE3GGSa0Ggh6gsUOdGDnpw0
         S5F2bHPfjP52wnPwm/fa903V+GYWBlsgwJVBIllk+EiN1/DCJCzknXL+4X925i7QAK+K
         ZBUlU4Vx+ZwLBdbcwQYgXjltnO1TLx4Z+Tm/eYF636hZ5sDk8r775mVd1Ev/HkIY5MZY
         YY4LYSU0iHaFleMDhDYBAaL/jl2mbNqV+A/TaFhFhPCRCdu2vuc8Ab/f1H+suimG7mlH
         iLq6DcHgDkp6Fbof20EK5cbPUvB3ZvOZBK93QfuzJA79INjzuWOZN2SHsy4PmHY/2PHN
         6VLg==
X-Forwarded-Encrypted: i=1; AHgh+RodyI267M2W9COGxviBLvEy8wiKbDWiQ2H1MHq6zh79tdFmsOcYAXUkiueZ07HpTNmi3iuYeBew0mrF6SM=@vger.kernel.org
X-Gm-Message-State: AFuF++mSO/1HBtHOUznlyYRmR+05xJ/UlEmhOxSYoyrvxFWJqf/Fv6XU
	/gJtSMTFgmGWvWRxuQEfjB4EJ5I5kv57oBe9NWDVnJgY0JnR/FpVffkpanTyxyICZGdu2eq5AlI
	7ez57k5o3HegvnYvzQxEHI29yUb/ljOV1w/wO2HGaKw==
X-Gm-Gg: AR+sD11UeqzxJnOkUw1Lh1aIDH+hqHhP2iwaMn5NjFdB/oymiDfCTX80gksMPrZ/jc8
	KSzlltewv5ttWUDBn+Rl4jxobgFZqH417BGz12AUKVKTWOStbh58iqgHaFYGYf+s568q0npA+t7
	s0R6aTHpNYXe6GVFGNWrU9Syfghmu0aWkklJIxJxUDt0bwYM7dIrqZOao/+YplsGhk/ywWZ52ZA
	ZY/3UqAsVvbn+08+ILAOkgkmbhGJUOsKbk0kQ4p0hbRt3dGXe7j5VAXnsdwg5Zd01JFYCGCTNlx
	k6dPO3OAjsPZKiicdkFFATh1l6rcD88GXcHJA6vvGIwoag==
X-Received: by 2002:a05:6870:45a0:b0:42e:7e04:e9ce with SMTP id
 586e51a60fabf-468328882d8mr1702119fac.0.1787867069273; Thu, 27 Aug 2026
 14:44:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827185722.3234622-1-csander@purestorage.com>
 <20260827185722.3234622-2-csander@purestorage.com> <CAJnrk1YfTg-Lz+TmM+c=Asc8N4QGuY9_g8zUXtaNr4O7hG1Djw@mail.gmail.com>
In-Reply-To: <CAJnrk1YfTg-Lz+TmM+c=Asc8N4QGuY9_g8zUXtaNr4O7hG1Djw@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 27 Aug 2026 14:44:18 -0700
X-Gm-Features: AcwNN1UylVUquZ8opNqZqu3tNIHriO6d1S55vB3s5Iygu5DbEGaADAEUlDBXhJo
Message-ID: <CADUfDZoEosgMMQ47BDWBskTOZrYZpg6VUT5c4kwczDLRLXYk=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Joanne Koong <joannelkoong@gmail.com>
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

On Thu, Aug 27, 2026 at 1:05=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> Hi Caleb,
>
> On Thu, Aug 27, 2026 at 11:57=E2=80=AFAM Caleb Sander Mateos
> <csander@purestorage.com> wrote:
> >
> > In preparation for setting the io_uring NVMe passthru CQE results from
> > the blk-mq request completion rather than the task work callback, split
> > out functions io_uring_cmd_set_res{,32}() from io_uring_cmd_done{,32}()=
.
> > This allows io_uring_cmd_done{,32}() and __io_uring_cmd_done() to be
> > consolidated into a single CQE-size-agnostic function with 3 fewer
> > arguments than __io_uring_cmd_done().
> >
>
> The conversion looks logically correct to me but the interface feels a
> bit annoying / fragile on the caller side.
>
> Is there a way nvme can get what it needs without changing the other
> callers? Would it work to just keep the existing
> io_uring_cmd_done{,32}() as is and add a separate API for special
> callers like nvme, eg:
>
>   void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 res2=
);
>   void __io_uring_cmd_done(struct io_uring_cmd *cmd, unsigned issue_flags=
);
>
> where io_uring_cmd_done{,32} would then just be inline wrappers over
> those? afaict, then only the nvme callsite would have to change and
> fuse, btrfs, block, ublk, and scsi_bsg could just stay as is. Do you
> think something like that makes sense to do?

Sure, sounds fine to me. Thanks for taking a look.

Best,
Caleb
