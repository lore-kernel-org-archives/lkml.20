Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C877C27FB18
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836810; cv=none; b=ZEG8APRln3rO2Fg/E6ROi6+6vbxhpqS8dAsqV/CfdJHpehvBYbzpjK7KsSh9slNkUc/LmLKmclI7F8iEcaod6C4zAh5gn5j8QbOgO1nFl4nEBiEtTKh8aH7Qyz2rSLK94gaX138SomQ6RsLsHYkpFgdChs6UXIUsunAD4+mB25I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836810; c=relaxed/simple;
	bh=ZfxXtFIDZaxEaB2DZZIymB/sPhHPfXU2HCfAD7m370Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LAuSVNhtenZLD2rWkH6UV2bdJE7fYSG7LLlhQmV2G58rww4zl0JebyEElBSuey5zWQ9A4+Xw6SPFobPMffClh1ueWaYQuOceeGMZm7WHM0F/htrAoLodNGPd06LSzsBdKSf6UF33uD8BmwumrfQYyqI9fwkBJHMNaj962GzflzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i01aQlTL; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i01aQlTL"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1c7364550so4271879a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788836808; x=1789441608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=12p4lFRZRGzA/IYQV7hQkbzRDXwADtGkCvDmrb2OlJ8=;
        b=i01aQlTLNMlR+jcgeYe2V/PIZR0nn1Lqt1uUHbJIeLI226Iv5CTIhYOwqB0etXmTWi
         0P4vQnuroo65v1rA+ICr7pHFL/oBu/A9i5TUW+2NHIwXQ2eej6Dy3urrh27HMTTbb5lT
         HRAzp1EkUmGmt7Y1hyDRHDgz97FxT8B/Ti8mgtWtxhDKwrCUU2EWbkGkTUrLCe2bA1kR
         gqh7qz94GsUby5mcqaLCGWs72BkSqqPKpHD6sm15IhUBJ/voukV1SunFga1p55mv+G+t
         kmxf+AwsSrfWsgatYJRYhqVmqvDkwRclkivdahJAPh736ETYQs+XDc6BHDaDQ/5oGZuq
         GNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836808; x=1789441608;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=12p4lFRZRGzA/IYQV7hQkbzRDXwADtGkCvDmrb2OlJ8=;
        b=g1Ejmuv5E/ZmA1t+jgeW/T4cNkQ9A4tXxf4tql6JYNt5FWpuGq0f0eyOx1KuWE1VFG
         Nt60jGfazqeoMIkQSnFqE3BhvKE6/IG+lbhj2bQXsC0c2XpRKDy6Rscl0QqhmmGWG4jt
         eW+Ow37Dxzkxes7VlOV3LSfyaD3xavqlnfclcKilkp20qtazZY1iatNNH9Qje5WszxW9
         5OyQo/EeLOiMeL7y2upHgttqI+9t20vxNk+o/DswVzyABUQgs5EVd9xank9YyDg3qWtO
         PKfsr/6fi3U/PhIdhkURTdJsUSiKmsdcH/wuHn2hDHmK8XIUEYjjpGvaDvb+/LI+kDhx
         zgQw==
X-Forwarded-Encrypted: i=1; AKwUvBx/qfa7jjiCwaFFaratg0p2uA+gF7+cb4X6xCwm1JtzpsMeqF2mDCe6ECZTMkNop0lwObHqDMkOmg3SHPc=@vger.kernel.org
X-Gm-Message-State: AFuF++nSJgG4jZvm3KfSoCVKewW2amN3NREIRoNjL7l0TGVRxi/x7Zyx
	j0VJpRtGKBQvaV/YJT79aswl4jeEOWArQr8ohQVSFu+/OT1xUqHEphTa
X-Gm-Gg: AYBFou0UhX8FG0U+TbML9JgWf159RY+4/2yeQpUCnpRM9a8oosjuJkejuth3SWzogLZ
	MOKxNDU6tYrGbxf3jrbCtbgBi5Ws88pw2OlwvqjUOrzfmcMbLaD0CUS3nYgSw4RPfsp9WEhKNya
	RXXGsRobbuz4DA8rxA0G1A9OgC590MqchPYqyjpmUvz/zmLNePqD3QxilKV/JQ/95CEGqqPf7xB
	dGGxgkGS4dPFvlssFwzWsX82UtA3F31Rqz6rk+3skc58rZdkgb10y8RfVXasPSNw/uy5/w7O73K
	AvmJLry7zQBJTJYoVcaveA779y+50TNdU+MHQky18E7nVlDKvyYvmAn9YHjAxmZoLe4EH/YKDTb
	pMXXw3/dEQZsSVnyuieohlnUObZtt66vl10oGyjXZzORZE8s81ejes3cJ7FZ2qifDhhBLbUcdyd
	ddfgagAa+yH74zb8lz5LoCpCM8zzVINBz0TTn3cFoUgjpzInJ2IqMucl5ok8LMRrURfZrSZkN6R
	54=
X-Received: by 2002:a05:6a21:e081:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3da39bb593dmr40716679637.2.1788836808060;
        Mon, 07 Sep 2026 20:06:48 -0700 (PDT)
Received: from localhost.localdomain ([2408:8607:1b00:8:3fb3:b562:896c:1ac7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45a6abaa2sm4390883a12.23.2026.09.07.20.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 20:06:47 -0700 (PDT)
From: Pengfei Li <ljdlns1987@gmail.com>
X-Google-Original-From: Pengfei Li <lipengfei28@xiaomi.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kernel test robot <lkp@intel.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v6 1/3] trace: add lock-free stackmap for stack trace deduplication
Date: Tue,  8 Sep 2026 11:06:24 +0800
Message-Id: <20260908030624.1300-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908102140.2ed161f1c851d94e1365520d@kernel.org>
References: <20260903132409.270195-1-lipengfei28@xiaomi.com> <20260903132409.270195-2-lipengfei28@xiaomi.com> <20260908102140.2ed161f1c851d94e1365520d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 08 Sep 2026 10:21:40 +0900 Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
> > Kernel command line parameter:
> > - ftrace_stackmap.bits=N: set map capacity (2^N unique stacks,
> >   range 10-18, default 14)
>
> Ah, this kernel cmdline parameter is also be a separated patch,
> because this is not fundamentary needed.

Right, it is not needed for the basic functionality. In v7 the core
patch hardcodes the default capacity, and a later patch adds the
early_param along with the [10, 18] clamp and the memory-footprint
documentation that goes with it.

> It is OK to use an official address for SoB, but to make sure this
> address work, please at least Cc to this address.

lipengfei28@xiaomi.com is on the Cc list of this series and receives
the list traffic; it is a working address. It will stay on Cc for v7
and any follow-up.

> > +	if (!smap) {
> > +		seq_puts(m, "stackmap not initialized\n");
> > +		return 0;
> > +	}
> > +
>
> You also need down_read(&smap->reader_sem) here for serializing.
[...]
> > +	seq_printf(m, "success_rate: %llu%%\n", successes);
>
> and up_read(&smap->reader_sem) too.

Correct, this is a real hole. Reset clears next_elt and the per-CPU
successes/drops counters under the write side of reader_sem, so an
unserialized stat read can straddle it and mix pre- and post-reset
values -- for instance a non-zero entries count next to counters that
have already been zeroed. v7 takes the rwsem for read around the whole
sampling and formatting block.

> > +	 * At bits=18 this caps at ~135 MB. The file is mode 0440
> > +	 * (TRACE_MODE_READ), so only privileged users can open it.
>
> Hmm, this is too huge to make a copy inside the kernel.
> If the stackmap is only increasing, and can avoid resetting by
> reader_sem, what about rewriting this as a raw-output mode of
> seq_file?
> You can use seq_write() to seq_file buffer.

Agreed on both counts: the copy is far too large, and seq_file with
seq_write() removes the need for it entirely. The element pool only
grows and slots are never recycled, so an iterator can walk the table
in index order and emit each populated entry through seq_write() as it
goes, holding reader_sem for read across each pass the way the text
export already does. That drops the per-open cost to the seq_file
buffer, and the header layout and version stay as they are: open()
counts the populated entries once to fill nr_stacks, which is a plain
memory scan of the table rather than a copy of it.

One caveat on relying on reader_sem alone: seq_file releases it between
read() calls, so a reset landing between two reads of the same fd would
otherwise splice two generations of the map into a single output stream.
For the text export that is merely confusing output, but a binary
consumer would silently parse it as one coherent dump. So the reworked
export also carries a generation counter, bumped by reset; open()
records it along with the entry count, and each pass revalidates it and
fails the read if it changed. A reader that raced a reset gets an error
and can retry instead of receiving a spliced dump.

Pengfei
