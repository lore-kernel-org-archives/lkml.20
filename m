Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F45231829
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279356; cv=pass; b=ReAEP/i4gB6D2e9bVGuajaYuuWbm4p3OY0e+YpVdcJsaAQaFGjKe/jCXBIz5SXzn4wl9NIUIbtU0m76lTFr3gakg1nnYtbU8gleckBLJiDbk0YDzrF1FuqO3cp0DNx9zODVu+ufI4SjhN5jbG/uu/HiqzLlQ2dN4F3z+N2Y/6jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279356; c=relaxed/simple;
	bh=iFDKH0dZQ7vT4Wu/AAsnm64voL3DOVnNYQNWvIJmaNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/I23wNVFZglC+ZUDWq7unBWzR6ZKWI2mCUsoi4sSLnt/gtl5/OP69b5PEdjOKPhLao/5woccC6fWVJFSqppMMVqmHLybnIoHo0Yca7E9aE0LeXhF/RH6pzVD9um/IVAhy7oIbvdVKLdpI124ybnORj2iqAK4PRfBU5R22uwJwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcR70hOZ; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcR70hOZ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-486e8faff03so229700f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791279352; cv=none;
        d=google.com; s=arc-20260327;
        b=BFEZpwU/31IVhh8gViQpLqGord2kZh/35lSa/qMiGHOwj6zfUarGELlCRmmQ//SF5Q
         ebTgFlUiXpKkU0w0twduA/7uwNwAoqgH2fDTCJbBrHNj5MLsl7sZBRFc5dwQlrfNmSWL
         QWSxJs5KOk7+HIis1OXK+yUbY7X223iBSsO1iMHJzKiJW1gYNlHUNL224lug6BHQUoen
         oafPm9qUpqwWos9Yhq0dk6mBbc6rtt7Sbe4o/IX+bnp02Zp2pdca3kHOQKKZ/K/EUN52
         I2SdNk8JlAyKeX3AiEmGI7r5PQwHtY1eGoJeNIrJ0tx2v6UnEtJ686M1VyFsYC9QrWDE
         vuNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Cgetbi5PuPxsF5bfepfN9t314B9UjLEVq/ZXofyuHQ=;
        fh=nvEFovDPpGDQ6J/NNr/TQPBtS70zIPqhjLPLzd/nwEY=;
        b=CjfEhQp3QtSs3bhNdAqkUPt8Aufbl39ONDhUAUGceSaegCbpoReRQOT03+7C/wdXlC
         Is1XmFZp0VexZ20jGi+q/wDBv5qIgqfzFmS78cc84R0JyALbQJhIS6pxShR5+t2I5+Wq
         pbUUmPw02l1STPO8jd/Ocpkujp27kNJeJatH0/rWDwQ992r2WNqPLLcCdo3vO4HQ7eQE
         XmVuHmDF+t1yfPNzw4P099bUnE2tfkZMj5uMCJJ67ZQYVixuYAohU1AguziN/m7f+Pxy
         vNHOk7xm+34fqC7cS/179H7M3LdQ3jfwS7pFvWT/dhzCdM0Sv0VcMgX3hCI/7M3rHnst
         NODw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791279352; x=1791884152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Cgetbi5PuPxsF5bfepfN9t314B9UjLEVq/ZXofyuHQ=;
        b=pcR70hOZjQ4Whf587GohZTc1nDoyj8+XRQiySzoaB32e0TJRcuN+eTUuwqv9etxxnL
         xqoEY3BgR1tD4XJ0dM26AOmvn3CZAuM6+bhOTbBIWThi14h0nLXCrvUJv52HP7u3OJBz
         AwsNvuJKwTxgyiiIsu+Pkc9TrYlNKU5MymsQLmxFuOMkRZk3P8w+UKM9hk+StAtiSA4U
         IUBqxnlp8Tm72aASj4I0fxlhPcgOjWuIx5LM1e/1ZrvEjiTEtoxCtg5Gd2HrV6NsN3OT
         P6Rruu4v8OWtU9Nk7BPeUhUcyjqQjbZNhAwl6+xnnSgioeoTPJ4wVKj2WUMkB02AOv/1
         IRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279352; x=1791884152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Cgetbi5PuPxsF5bfepfN9t314B9UjLEVq/ZXofyuHQ=;
        b=DnivTUMYrds3KzwFXukFu9WXNzbuu3qrM0RG1QGtS9xUY+w3CFT5DRWJmZW85PdZSK
         DLMNMPm7MjRmtJk4Is7HbUdzI11NTH7d88NBJxUkQxq5pdELxutHradbthEkGStp88dM
         19+ifLw5pwidhoeMQ7Z/JqtivfgcOezUubCA2qINKRmm3N64W2yflYagVkZfBKehKnaW
         VdQVgiBxNdcdyvoFc1p4nKVKzJn+Hzrri9H8omyxv9kDzdyQIRdya8Dwg9aWPenvSyyc
         Qo5mRdwyh6tSOOhgmBDvJ4/k5CX/TMXDCZ7BSLACzLMXhXy0y1uMSc0JjnJF8iWeXRS+
         2ugQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOnrASDUjoC9Y/iq1HfwGtcVfGkueJCxd7FY1Ybp9ddASL/urL/qFJ0A9cTUtnB0yBd6JqiyxenOk46aA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBAfdU3jh16NOhdsEaCkJoIN4/JmWhUU4VoUOJgCkzbiK6P0dE
	McxXk+RJOuCRk+yff7HAR25QBkaYQDT0RD6fjllnnB45eTia/3FE3eaIhK+AyMq0Ae28bqKABKV
	P5+ODGmlhX/SnZu9Y0ukhMzpkMM6Zttc=
X-Gm-Gg: AYBFou0H1GbxCppNEqL4mItfqbIhrwxLbOvYydbuZ90CF7z69+05yPLCFB5dmWqoT/6
	/lk/YDsB6cKyS00qm3A+ZIg6fMKJg9W8X8EYv/eH1TMaKFJzb9hSeGsYb7QSnzQBkEPmcuRE4su
	tfL7V9+amqwFqB+Zcw/j5qEZxUjM57IwcrioPdRS3/rwlvD/mypxdTdB5I75HcRMJrZD3/sDbHR
	e+v5JU9FhldNzS8SlEwTWqWZ+8oB9HX66smq4hI2X4nPa5KSHRqOpErMcgAmFstrdpo9I6sDsYf
	if+gwwZM7npcfKdrwnboNLrNt9BtZSDfq4HU7wOR6IMEpbZkjGDUy8yakgevHeeqgURc7cHTzJF
	k2Njs3YujKQ==
X-Received: by 2002:adf:e006:0:10b0:487:81c:6de with SMTP id
 ffacd0b85a97d-48c6d1ed705mr1065716f8f.34.1791279351554; Tue, 06 Oct 2026
 02:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006002307.2669023-1-usama.arif@linux.dev>
In-Reply-To: <20261006002307.2669023-1-usama.arif@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 6 Oct 2026 11:35:40 +0200
X-Gm-Features: AclHuK-I-EC0QMEEhgjEh4SjGXEPR_qp-oBVhjIP65Qw2qNeTHjeK_O2GUMd75o
Message-ID: <CAKEwX=N3ks2O-dCYPRif3NnHQckdVqLiPGRn03GkCuEE+FVgtQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] mm: zswap: reduce request contention on loads
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev, dsterba@suse.com, 
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	terrelln@fb.com, yosry@kernel.org, riel@surriel.com, shakeel.butt@linux.dev, 
	alex@ghiti.fr, senozhatsky@chromium.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 2:23=E2=80=AFAM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
> Stores and loads share a per-CPU acomp request and mutex. A low-priority
> store can be preempted right after the compressor drops its stream
> lock, while it still holds the zswap mutex, and a higher-priority load
> on that CPU then waits for the store to run again. This follows the work
> from Sergey Senozhatsky's zram series which splits it for the same
> reason [1].
>
> Patch 1 gives compression and decompression separate requests, waits
> and mutexes, so loads no longer wait for stores, though they can still
> wait for each other. Patch 2 decompresses with an on-stack request when
> the algorithm is synchronous and needs no request context, which covers
> all in-tree software compressors, so those loads take no zswap lock.
> Asynchronous algorithms keep the per-CPU request and mutex. For software
> compressors the series allocates the same number of requests as before;
> each per-CPU context grows by 72 bytes, and the load path is about 270
> bytes deeper on x86-64.
>
> The series does not fix two related cases:
> - Stores still serialize on the compression mutex, so a high-priority
>   task that reclaims (direct reclaim, MADV_PAGEOUT) can still wait for
>   a preempted store.

Any reasons why we cannot tackle this too? Or just one at a time?

> - On PREEMPT_RT the codec stream locks are preemptible, so a load can
>   still wait for a preempted store inside the codec.

Acked.

>
> The numbers below are the slowest read per run, as a median (min-max)
> of 5 runs. Each run is 12 seconds in a zstd VM with lazy preemption,
> vm.page-cluster=3D0 and swap on /dev/ram0. With 1 vCPU, four nice +10
> workers page memory out and read it back while a nice 0 task spins. A
> nice -19 reader pages out its own buffer and measures how long each
> read of it takes. With 8 vCPUs there are 16 workers, 8 spinning tasks
> and 8 readers.
>
>               Before series (ms)      With series (ms)
>   1 vCPU      22.3 (21.6-22.6)        0.97 (0.72-1.4)
>   8 vCPUs     314 (97-2542)           7.0 (5.0-98)
>
> Reads over 10 ms fell from 26-35 per run to none with 1 vCPU, and from
> 3-18 per run to at most one with 8 vCPUs. The benchmark and test programs
> were written with the help of an LLM.

Great find, Usama!
