Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D7755C31C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790398; cv=pass; b=EwWpPr0iG1zi9wC5cDLSn1TicnNU0ezTDVbuEtTlPZFJJOmb7eIMGB26IBENHDjKcmQR/KYToFbv/PmO0yhXQRlrHngDvvOcdapJyzYUmYKzn+M3rL18JSJTfnDi+f46GSnXzvBUtyI1sstnW0ad2FiC5r2pbYq71IMAw1yugpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790398; c=relaxed/simple;
	bh=w0tICuoTa2+9t83PhN3/TCdqvSbLHcBiTxwpgG1m2wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YXxWKxk8+DVhvTnGwvbzV57H6m1TrLYI/1Nr+MRcW84nUtiQM50ZN/E8800LaY38XsKE372eseIrkWAzEFlTPLn03j8PPBwYYgh2/FqUEJ4sY3+gRXnoAyqaHHA9ZfwZA8RS73sFgtb5htkdnrq7t3ZMeqoZ56lNIlP9qMRV5wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vl2j8dSo; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vl2j8dSo"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db33db4de9so5775ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790790396; cv=none;
        d=google.com; s=arc-20260327;
        b=DCKN3EijTkI/xQWWPt7jtZ4Gx4XbjEwd8oHJe/XjM4tZa5j2ZCtdX8V3YbPLlejwqG
         2Jdb9U/QQl/gnScsRZjz2x2a/bDrgzE1oKWJrD2mcrJFxAHAhTPpErOW5CH83FHXUizg
         URMoY+EK1hdqpbyIQiB/MFMYsxsSYIJFgYsRdXKHsA5r+Qk/qH6RrJ6fKAJ7qD55G77F
         xw3FWSNmsZko75rOgOI6Dw04xHN9Azkm7ho/omlfJedgMarFJrASzVMVI818BrG6qUWB
         ZuDXE6Z2rCr0MbwiXbAErGDA4XbXfB1XR4KLx9qvNTnHDz5O2NT6IrI5YucoKF8iclAF
         0XlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=owfGESY65vbCjIAUrqy6g/URvmlOMSe0YC9FIcjy/6A=;
        fh=N4VHKR28jsRd4fOlx8V+3qdGhgRRYk9ZaCHW0NtQd/4=;
        b=AxRhrqiPcbCjuF/VK+91eO/6ZEV0W9bRdcLPc4750kHG9YNoH16AUqmZP4OHcWHh+o
         oSo9JCEaOOnxcIJt0s/lvtmIaFPdPi6BRTgdeAHORWnBBM7egTOn0pdAIrEJOqa73Y3d
         hFsZmvtYaKcxux+5INJXmvX20vc8NiZHojUcUaZU0CKHXHa8h3OYGbmeGEsvoTPx3sla
         U4WSap+meE02zRphoBTxn2yhiiL2IwvmgyRSZzZYUCmXAQcYPgiGgCs9YhScsrlLNQfJ
         ZDX9QnJUIvgWGHJiP7dsjze+tWzQkoa+LA37QWgv0CiljeVSSv82uy5vHS+b0vgpe8aY
         cjjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790790396; x=1791395196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=owfGESY65vbCjIAUrqy6g/URvmlOMSe0YC9FIcjy/6A=;
        b=vl2j8dSoWT8FZQqYlYNTq4ID7QzjgUYE5KmHXAlBlnR/3mfq+ujvKgLsQt7PA9k6gE
         Fh186emZnYpzdZvxterExpx/yMtNYnEIlbegfH824yd5rCQF44wA330Gr0ee1lK3NRv+
         8w1nvoPgS38aBnn3kmNX9LYvq5Eu2rVIgWt8UQmrNa8Ss+XjLEJ5cvR/Op5LR3EXHBrH
         82WrRuFHhEciohoSuBurypNtw/OBquMFFSWHDJ5uljl3sT8olSJAi98l+J8e+xIEvsWe
         xz6Gji4xkXWbYZq4eewezXizsKsQamCk5bhh4QMHSahsOtNZhIFCxv9tXgvVn6nLKqo0
         LjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790790396; x=1791395196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owfGESY65vbCjIAUrqy6g/URvmlOMSe0YC9FIcjy/6A=;
        b=hVkkv6lDmu3BMPh1+yxwkrW8Dl1KvxTKYsItxWyuQZ0znp4aiHrVGn0/xTeN6c9tSE
         IjLfJrqSPSygFKEXz5KQsvkYVq5oTENrWeBJUOlP/eo7ZBoUfw2Jhdb/gBLMBFWncSR+
         uJQBupwdg6M6vBChhMUQMY5X9TiTUXNFcV+VFS4Rw38yJF1GfEmXc7YMZm4l16K8GhHm
         VjJ9vpiyVrPxQarSmIoAQUr7tGyMz9T4Bs0Yj9wsCqqGV4rF1jEfXoduTYtDT9Ho6MPw
         hlRLswgODQYKgtsBzZAOseCEdbZx9VJ3GlLK8BivBQqLn9vp6h0F8JABcKJ2MpKVuzV6
         +ysQ==
X-Forwarded-Encrypted: i=1; AKwUvByPJkf2/0tR24N0fJVDfbs/afVPGvh0nxBY+hg0t6VYC/wU5Y8ZxSkHKNwndKthSJwizs41GszSc9py5pM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZloPAzhyzRxG4l1fxqen3lhLsJjMJUdk9/NOQ+yu3uZsdXySS
	EENx10TzmlPf0ROuiPYioRAgF8bJddsCHZWNrWuj3cwo3v0E9j6xdQmg3i5yPt79pOjqKom4xg8
	7VdaQsZxiiv7rdthA8ebgBlYcUOumD0ro6m9tCMCR
X-Gm-Gg: AYBFou3/bqVzCCOLFWNIM+DM5XC2eYUNtnXr2BrKMu12Ks78ciX/FQuXWDSzhUHQy6d
	sP3lOTReNJdrQikflH4to09RumBDrsqcxqZx85U46Bs/qxXIzU78BO1o+RHFETfU5XbOe+t9q3O
	mSlamGoly/G8UKR/VwwhOwQSLfGc9hvwUD6KjoGVaNjgJdupY71wEVu+xenV2nCz5/NVu2oid6M
	cjDFsi1lRs7aqdDZYUSsm3fL9soGJ6ydEEJVeG+MfY/FhIIbFbPOetWC96NP1W21y8mDqaN73pP
	GY6NbXzFJnjaXRI3AC2qlBu9eY05ACKnbQSgIBW9cGmWKaxdqLmyzkC3kFklB8c+Stynm/wyVR4
	UQa/3pqffGA==
X-Received: by 2002:a17:903:40c5:b0:2df:9957:d1bd with SMTP id
 d9443c01a7336-2e2de7b2ba8mr4902705ad.18.1790790395316; Wed, 30 Sep 2026
 10:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-perf_fix_pylint_errors-v2-0-945cd526576b@arm.com> <20260930-perf_fix_pylint_errors-v2-4-945cd526576b@arm.com>
In-Reply-To: <20260930-perf_fix_pylint_errors-v2-4-945cd526576b@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 30 Sep 2026 10:46:20 -0700
X-Gm-Features: AclHuK8a28BfpDM1TaVvVdEZDtDcaID83iikH9N8YTnc3Afd31SS0Gk0oIXvWO8
Message-ID: <CAP-5=fUyzOYv_f1apjXyOLRUzmCPTTk3yDXAOb=wUbukoENHNw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] perf python: Avoid shadowing exception name in
 PostgreSQL exporter
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Aishwarya TCV <aishwarya.tcv@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 6:11=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> During the perf build, pylint reports:
>
>   ************* Module export-to-postgresql
>   python/export-to-postgresql.py:319:8: W0621: Redefining name 'e' from o=
uter scope (line 100) (redefined-outer-name)
>
> Rename 'e' to 'db_error' to clear the warning.
>
> Fixes: b1f968c9656a ("perf python: Port export-to-postgresql to perf modu=
le")
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
>  tools/perf/python/export-to-postgresql.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/python/export-to-postgresql.py b/tools/perf/pytho=
n/export-to-postgresql.py
> index b6782129354ed3b1bd750af41e7a002c7134bf12..9cac64dee361214de3d1f9907=
c5e6849327c8ed7 100755
> --- a/tools/perf/python/export-to-postgresql.py
> +++ b/tools/perf/python/export-to-postgresql.py
> @@ -316,9 +316,9 @@ class PostgresExporter:
>              # SQL identifiers are double-quoted; escape embedded double =
quotes by doubling them.
>              db_name =3D self.dbname.replace('"', '""')
>              self.do_query(f'CREATE DATABASE "{db_name}"')
> -        except Exception as e:
> +        except Exception as db_error:
>              shutil.rmtree(self.output_dir_name, ignore_errors=3DTrue)
> -            raise e
> +            raise db_error
>          self.disconnect()
>
>          self.connect(self.dbname)
>
> --
> 2.34.1
>
