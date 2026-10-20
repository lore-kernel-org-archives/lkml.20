Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792511276;
	b=39L8/ej2P0Ua3B/otfbwbCAcl5Lxq6ls6ve/FWpGovlVvNrWq/m6ZHngHzihScFPYshk
	 3zE5ksTuv0N7mPCgApFYTnbUq0ob6qSAl/pXJ6KhxDVIMsU7KjfxF7LPaVK6iAsp76Ke6
	 itVNrMuHxoomSP5nZD8TW0jBM16HS58Mn2eCnLjQuwkADVyltgWEz4QCCMe8VQ+271Wia
	 R92Rpy03nI+gusyAPAYbZgej47oFt2+hBCj1FFo2G2fAxMbpGBcjTXsQAyNxQ050RqyK+
	 xJvrHaKwExVYRgKNp6gWHk5jorH3MST+h5q3BbNQCX6cuJT484e0Dyfs/5Z8xWsH1Fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792511276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yRC6FlkraK3/GX/G0Bv3qFOVKgUroYX1xrJ2PWq82C4=;
	b=gQXtzSBDIcaCZrZm0JrZJ49UttBqBlan2t60x8KvhlKgx8YlYym9URvqsl0HRPv9H7p8
	 3eAWmf2mwj3wE1UlibgDZw8I+M53gxbaAllHZAuQQ9CU8tlkO0EIilnToqVOqraeYCUUA
	 Y6nLSoThMKYJRFmfVEOHCgWKPfOvMt5eUFkaou9rTPNEU/mCz9MugGzxxwa9mlxlx0Bek
	 qIJYHzocm4dMLMwbaKQs31q+IEfVKPnxr7oHzxcb0WaG3WHHtnoUgTmkOyh653jeE49C3
	 75FcT+umQY4QmdO+jNUnEVctoNaS9JRtufYlKVjifS3fknoo8iCfHOlsL1p8Rh0CLQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qSwuIXJA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A02606A333
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71A02606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qSwuIXJA
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5337fa12431so317111cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792511275; cv=none;
        d=google.com; s=arc-20260327;
        b=dpici9Q5QoQQFAsVxTUI24P0bJnbmTi+ADLxpqgoxkEHwbuRbTB2ziwZ9lKYoaE6UC
         McyO3NVcpq/KkZFRbk29UejaOH1TschvrUKpas7irTZJGTYJJPmqFxhiwYoojY0iJXlH
         wmYk6X1F6hXNmgNypvZf7i9jmq44LJIpAsFaDRfy2rK2MyDhm2Rlo89zo/1seKflZ0m+
         3LbmLpW+ecmfD/qi0Y53U3mqrlDzmJ6ZBjezicv+y+sWjqfBvQrRyzBqf0YprONUib4V
         S5t4+xO2FRo7TgEoVDwMnNdTx8LTj0fqWz8vpk+3hOQT7wyP3Q7X6fedVmoX7Iqspz3S
         KUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yRC6FlkraK3/GX/G0Bv3qFOVKgUroYX1xrJ2PWq82C4=;
        fh=SCW0NZ5BnPVJLDU1F3gJmzUMjgdLab6lBPrjPa+buGI=;
        b=SMgbwNR72ChIMqaiphhIGunxR8u3wyxJ1UmBYmWbfpJ4jEABkmTPi71nkr+rWi3wdV
         S03O7a8AuDXQSYj6lClESDsXwdmgPFJxJOfbVZBLhxm4A1n21/xkNbdu3n9Lm7o5oDET
         mYv9fad16xMXomhLLz15/esqtqkQEvsEXX66BcY4qnjn3b2m9afXdTtIG0/Mrtuc86Pn
         e+prCVeyp1YVbkO6PpAehG6DjsfurxwAHE5lefen7EOa5WOV0l9Oz0bIGnDmgWsSpBQA
         cjv43oglDxDckyg3uFUgTTWIDheCYV6y3ZEK8O/XXpWi8CDykyMizzhFxZ0PbN5NoYnb
         MdOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792511275; x=1793116075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yRC6FlkraK3/GX/G0Bv3qFOVKgUroYX1xrJ2PWq82C4=;
        b=qSwuIXJAgpoCsSGWpxrRfhS5fWBq6K8db5yEtTkjsuxjI3mq2WGFEMDzMK6tA2Z8+p
         4OIP+EzCO/ujp0lzITIRCfUz4P5IOGyKf5H/l1ShgJaWJndKaIg/m3t9J94hApwe4ly2
         o+M66QL6zsNMonLk/cossqvHi/mTQaUqeI/ODFISttFIUFzotknj94R7xTfPgFqXBT9K
         Ql8WPSf2kOmn3bzLzalp5l/bH2rPMZkRxh0TR2IwoErrWCtzq787xajSUJo80UPg98eF
         pCGyfd/OiPHHYVUfmd2Zd50ZyRTfR6FPS8F1S47qVHhKWdW6PbBqDepiAFFTKBW6macL
         gSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792511275; x=1793116075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRC6FlkraK3/GX/G0Bv3qFOVKgUroYX1xrJ2PWq82C4=;
        b=10l/SNyrb+qPdrCfplOhWJgzB0gUB7JdOfSCStNWJiIcnA6687YN/gtplIzxfleklz
         uao9B4kEtOfTGV2Mu84XAlRDqGKgkhgFae3hnQxTTzp9Loybga7jW9UCGm7gPJRvG1a4
         ur3tXxaOR/xm3l/V/5YUu3NNWqqPJD0xLoUi7FiXwBB1qF2vnbq9EikcZcEN/WyggK96
         CUnSlWBHyOi6ZXEkeuZh25KvSyTn39tS82WsJUGstMvUqcQw6syjEzMXb2a0M3De0nfa
         DB6YprigHh45vxjXuieBCopB0D2Sdmh4qeZ5kirEP5PJVLl2VXodeYm97qqB4A5qctOH
         Bbzw==
X-Forwarded-Encrypted: i=1; AKwUvBwNYNH30xR489E2jzbEmKdF3xs6MCF/awV+iTYds8MLGJzMhFE6o1cZb0NPji72+iR2OQUc55LACKA01gE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/qzgk8ws6CvFdKH9ZCNjSNDSK4+5ac3fnRujEPfpjqZZ7Eog3
	ZppIGZJvxV539TUjKLQRtbpf2+ANqJUbqKZ6qK5dJjeMcKs+3kwMPs8Fo7HW7f2alTYbDhsjFAr
	Yh/pgnXHen4Hwf/ml4bub+hlr/syH4oOTOC2Nh4xR
X-Gm-Gg: AYBFou1i1rKo7zWL/VfiFdPJORqzs5MkIfga6JxUHbnoZNTwE+h6Te0Lc2mHwGEktaQ
	3zMmEavHZspGantXQMthFjVkn3wl2sIiNiS5z/ZK1NMOG47h2rryWOA6Jig4LRUasOC1A5tb/2z
	/TFIwWDE3Cdpbr4H3E4WLeu8KMbKPVD2VlJI5+K52esbbm5YaKdHOAru820jMRqLY3U/cM3aHR3
	qkJAb7At0kO2uuRh5HSJbCjVyjM6MLWh4Bn1sUFRr7JlBRVugRhHv4BsQAhOFI1HKvaJn+RT8xD
	sxfZZsN66I9kcNhlClZDhgiz8Ee/2yEAHLEYSqs/cqNADyl/csISffnxLbEcrVU3hKZrKcMZvK3
	yVS4jBymneAcZ714gRE2C
X-Received: by 2002:a05:622a:408e:b0:536:353e:8d2a with SMTP id
 d75a77b69052e-53684d0ca3fmr22835561cf.1.1792511274816; Tue, 20 Oct 2026
 08:47:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020053226.55936-1-namhyung@kernel.org>
In-Reply-To: <20261020053226.55936-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 20 Oct 2026 08:47:43 -0700
X-Gm-Features: AclHuK-6g8Wi7TBC4FmkP0REbUcITyrib4F3WWwrmPcVPR9OBYT6u41SvbVECLM
Message-ID: <CAP-5=fVmn-xYGdMVKq5b6at2oqagXhVrj7a=r65Z80dLGa_DGg@mail.gmail.com>
Subject: Re: [PATCH] perf bpf-filter: Fix memory leak on bpf_link
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 10:32=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> Attaching BPF program returns bpf_link but it leaked like following.
>
>   =3D=3D51328=3D=3DERROR: LeakSanitizer: detected memory leaks
>
>   Direct leak of 1568 byte(s) in 28 object(s) allocated from:
>       #0 0x7ffbe76ef24f in calloc (/lib64/libasan.so.8+0xef24f) (BuildId:=
 61e8165ca90f7a4f06b73f064a938c76deaae079)
>       #1 0x000000625df7 in bpf_program__attach_perf_event_opts (tools/per=
f/perf+0x625df7) (BuildId: 5e6309fda155e58708e92f1c76d44cadd585d0eb)
>       #2 0x000000beddc0 in perf_bpf_filter__prepare util/bpf-filter.c:507
>       #3 0x0000008f3def in evlist__apply_filters util/evlist.c:1421
>       #4 0x00000044bbcf in record__open  tools/perf/builtin-record.c:1469
>       #5 0x000000453f9e in __cmd_record  tools/perf/builtin-record.c:2594
>       #6 0x00000045dadb in cmd_record  tools/perf/builtin-record.c:4427
>       #7 0x0000005df56b in run_builtin  tools/perf/perf.c:383
>       #8 0x0000005dfa0e in handle_internal_command  tools/perf/perf.c:436
>       #9 0x0000005dfddc in run_argv  tools/perf/perf.c:480
>       #10 0x0000005e0333 in main  tools/perf/perf.c:581
>       #11 0x7ffbdd450680 in __libc_start_call_main (/lib64/libc.so.6+0x36=
80) (BuildId: 85075e2ae2e13352a1413d41c327dacf6461526c)
>       #12 0x7ffbdd450797 in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so=
.6+0x3797) (BuildId: 85075e2ae2e13352a1413d41c327dacf6461526c)
>       #13 0x000000409c54 in _start (tools/perf/perf+0x409c54) (BuildId: 5=
e6309fda155e58708e92f1c76d44cadd585d0eb)
>
>   SUMMARY: AddressSanitizer: 1568 byte(s) leaked in 28 allocation(s).
>
> Let's add an xyarray of bpf_link for the filters and release them at the
> end to fix the leaks.

As Sashiko noted, libbpf's bpf_program__attach_perf_event_opts() is
designed for callers that transfer ownership of the perf_event fd to
the returned bpf_link (such as bpf_program__attach_kprobe(), which
opens its own perf_event fd internally). When bpf_link__destroy() is
called, bpf_link_perf_detach() unconditionally disables and closes
perf_link->perf_event_fd:

      static int bpf_link_perf_detach(struct bpf_link *link)
      {
              struct bpf_link_perf *perf_link =3D container_of(link,
struct bpf_link_perf, link);
              int err =3D 0;

              if (ioctl(perf_link->perf_event_fd,
PERF_EVENT_IOC_DISABLE, 0) < 0)
                      err =3D -errno;

              if (perf_link->perf_event_fd !=3D link->fd)
                      close(perf_link->perf_event_fd);
              close(link->fd);
              ...

Since evsel->core.fd owns FD(evsel, x, y) and evlist__close() closes
those descriptors before evsel__exit() -> perf_bpf_filter__destroy()
runs, calling bpf_link__destroy() ends up closing FD(evsel, x, y) a
second time (and my v4 patch 2 has the same issue on FD(evsel, 0, 0)
by assigning skel->links.perf_tp_sample_filter =3D link).

Instead of using bpf_program__attach_perf_event_opts() and tracking
bpf_links, how about attaching the program directly with
ioctl(FD(evsel, x, y), PERF_EVENT_IOC_SET_BPF, fd), just like the
pinned filter path right above it in perf_bpf_filter__prepare()
already does?

            fd =3D bpf_program__fd(skel->progs.perf_sample_filter);
            for (x =3D 0; x < xyarray__max_x(evsel->core.fd); x++) {
                    for (y =3D 0; y < xyarray__max_y(evsel->core.fd); y++) =
{
                            ret =3D ioctl(FD(evsel, x, y),
PERF_EVENT_IOC_SET_BPF, fd);
                            if (ret < 0) {
                                    pr_err("Failed to attach perf
sample-filter\n");
                                    goto err;
                            }
                    }
            }

That avoids allocating struct bpf_link_perf and extra BPF_PERF_EVENT
link fds altogether (fixing the leak without needing
evsel->bpf_links), avoids the double-close on FD(evsel, x, y) since
the kernel's _free_event() -> perf_event_free_bpf_prog() detaches the
program when evlist__close() closes the perf_event fd, and also lets
us drop pe_opts (.dont_enable =3D true) and the
LIBBPF_CURRENT_VERSION_GEQ(1, 7) guard.

For simplicity, I will include a patch doing this in v5 of my series.

Thanks,
Ian
