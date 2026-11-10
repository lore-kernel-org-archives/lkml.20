Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794282308;
	b=dk0WXiO/+GtC12BZZhiPhFeedo6FVPHi16lI15s2l/a/0TRSeoOGy/5a3zInJkj3Y2ET
	 0ih23S8/A4YqREDGQJYEgGrsiZzH8tYGK329qQs1iD9z8av5/LBQzYM4ZHAdydF8p2oUf
	 0RtEGinaMCyUGcoUh9ygk0SyB/Jkr1es2TWooMFpxA2Dk+PMty/1OgApcslf8PI0NVcXe
	 z2Rl4uFD3MZ0vo9uE+NF3EFQJ2HZOpokHPId6QDNGGAZMCiqPGodB0ejl0Ps/7ZRkFyCz
	 EvDnVwoTOr/zwe0lSf0439Hs4K0LFBkovYQtEoMVq5WemZu4Y2A2ol10J9V1sS80HJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4mDyPcBarqrkxPjTC16S8+UW/cTA1USsfs9afFvxLu4=;
	b=pQRjK03Srkn0M/dTubtQEqplstk0mas0PV6MBNbjRKeG7X8VjJCUpuW7r/YtVBlQPK6/
	 RWV3REd4AbqtIh0b40SBy+LJJU3e9KnK/H8TGO9Qq7VCuhLeHTRG8RUDVWAt1KVV93twk
	 OdzWpfnlXRpcFsK1k1whg0aB3BODRWpim8+BvNHFW0iP+CtUrNe1LqcgyatsRGVwOfJ2T
	 pG2NhzZ5mVwQ6j32lyzN/G7kWw3HmFqbrA7bPKXzKpTdP7Y1k0VWMR+uEkFFSF+VZYb1l
	 BAu12uJwkiTCeX2rwA7KYc7SrZVY9VTxMCTYBDI3ep9V4wF3EW5yKjbyy1LjbCUVgZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=mjYLkLzY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DDE606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36DDE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=mjYLkLzY
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490585eddfcso1238042f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:45:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794282306; cv=none;
        d=google.com; s=arc-20260327;
        b=fCfxSeOVsJr7ekNbmFya3Ki+pZXaQ1MCU4nM7gW+YgyuS9URxtMHQUZETnV3eT9TPy
         q0C26NJzrC/bZSFj5kPd+YSiKxSm3judKwK7Vcj6tIlsuMq5chtX/5QD1x/43huMiB13
         Ctf0gWoFsqBtFvo3OPO6h6Ewtwc90KJEPGN1aXvGCLY28yHQI6Bw4wMTepqJXTMobI5p
         TIt/WFyyuCYxNg5meQolvmmNXTN3WKKmsRyxjOKkjPcwVUw1/eDDIGL22M8H8bqhjBt5
         QBz9aljc1aNPxB+RVdhZpJDEpNWyq3Z/bW8ewAphtnmUxDZ/FaWSi4cyJy4gYVvF3Pxc
         LBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4mDyPcBarqrkxPjTC16S8+UW/cTA1USsfs9afFvxLu4=;
        fh=QcQPqR7TaQPcskWFuwubLA7XFW54VXTm2pcXrdrk8lM=;
        b=se2kn7GZ0/afDT06HbvbTGVCxkKEqJa0l09ipdA9jElC6qTfI82cnzgpBhkyseEWZx
         iDjWAGnA1dS5uHE3yGEOn3VynxGeXQqyBclF0tDrAtNg39ynUAwEy4rzaJk7B6PtNATi
         JS4dh4/Llq4XUlYKNYcoSBxFsMaa8JfXq+lkxoKNLEyzhO+LRLRpH2p7H5fIuU/GWh3d
         zWBtCE71DHXL++QWCMinUL7YoVeNv0reEF99yUNORSMO4aNU710aZ8HpccTBoOYpp1Ls
         eGGK4EwyqJWr7u9gAytptzlUx+DIMAks5koh9azHfffHicJLHhchtnK9a4VGCtXjyoGK
         LudA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794282306; x=1794887106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4mDyPcBarqrkxPjTC16S8+UW/cTA1USsfs9afFvxLu4=;
        b=mjYLkLzYX2TSXfhZ2DiPIY0QpyUYlx5rNWrWdFVQusHG+cIag5kMJ77PSnY/euUotE
         HCQwkPdOV3OsexUXEBUH34v/4AclRup6LqUrCFw2DDGSKYZGC+CMem3GBmHr+SW2XK38
         NS5vbwl2lX9w+BbHEgHUKshmYx0TQZD+9uwNIH2eklCVVOZHOGWoCvqscog2iUgogBYw
         wguOH5VSZ+fJzYFW6wYMO/hQavGSkXZXXjjTHllWwuTkdfJU6mndKvy84X7IUid/58mb
         OomA9xbwP0Q/5NgHCvLKq49R7WvMetKA+kwV+LmJyhEBLqReF9ZL68txdrLnkgDtSm5w
         Ta7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282306; x=1794887106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mDyPcBarqrkxPjTC16S8+UW/cTA1USsfs9afFvxLu4=;
        b=HmnhgDewoi4mTxruJufM5+59cHqpwbSUzsxKqDjraMWauj+NRUxSnbW/LCKE3LOyi6
         iKShnwCTU26oQEcwdkH4aS4rthKkpLh/ZcODBBOCCtfBo+jNmYJwCb8rt4+DE98zostB
         /6S2DgEgNzeqim07qnZoc9WGSFBQU+DiPTM+4jfMSbbCbWk4+WpmA/lF8Ytl29+rp7pe
         +ZcQTRPRPACMrikCeBDp5MHX+xhsWCcd9E/0Uq9q+qP7f/aEVnAVBD36K6Z51fsl6qnD
         eqHpvXoIySoGjcoF9CDJxFRmuFMcJfKIWwAVw36Tmp3FWo1qBmECJp4mme/EEZIqkgJI
         sk8g==
X-Forwarded-Encrypted: i=1; AL+hErFmQmBqcYsSDXmFpA5ywUFCFu2XRR+vIz4O792TUjfCKRE+Rw9kW9fjkkfKenRN0v6czcpvqEQL+JBc8EY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AL2s6oIyi12jLYZdWBc268CkoCysBxYV6AF90T9x2KlaMESD2
	Fl8ocMBlBkwrRxZkjxOPwTDWSeQOD3eucUEQA+eEEPLFzxCb/1jSJfw2FQtXxn7G0kv78e1h/Y7
	cAETyYY3MJBtfn4bFHLdD/yHKZu5e1tU5Xz19Bkr8Pw==
X-Gm-Gg: AYBFou0S2LELGJ6MKz2FigwjxipjoHk9W1nP+kp8fNuAnGwPiRrjVBa898XEOA3dB9E
	TYkhKwsdoSzkfSkn+qdy7h9C15+JUrj8ntVi9Nfk7XVQh+Zuq81OEYx3JyIRQiONxXQ9kAaHgj8
	Y/4zrZAyYAxTK8Pv8iwdYxUVcFks3FS9TpP/RSNchKcFTfwrF1JnHdj1fjVk7tHChcQa2RfFlWX
	pMd8k8M5Jkxdor+xIppK0YUJr0ccGCY5sdXPrgYf6JWAbfxurxSnvrzcZdHj4fqgVSqpMBt1Uut
	TwuZX/jN+GsRaNOd7ocYqhLr+FV5fpLpK77sun/JYpth0Q3bygH60OUvyTRLEMFTPV9G03rxwyB
	jNMAbit81zlWj3rPXda2VPtFItKDZoFvA/Al48a/T3yura5Lgk+GUzQI1X5Rt29jVkH7G+1Vd16
	HH300GygogC/cN45S0i+C53wbPN8XCaDmey7Ht0Jd7nRO8a1wg+e70R3Sw
X-Received: by 2002:a05:6000:2289:b0:492:7efe:3fc4 with SMTP id
 ffacd0b85a97d-4982f2b5c0emr2318492f8f.21.1794282305918; Mon, 09 Nov 2026
 19:45:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
 <20260930150213.799245-4-anup.patel@oss.qualcomm.com> <CABb+yY0gLY8VuY0pDKKm4EfS3wp3buLgF=waajaA7JD0UX-VwQ@mail.gmail.com>
 <CABBgwmsU9S2kf+RL53G8Tk4ar3=6f1zMTss_HmE42fxiwxVFpQ@mail.gmail.com> <CABb+yY0SZuCQoLF65EGY0=R4=p7fO3SU53pPhT1cgAj26u8gNA@mail.gmail.com>
In-Reply-To: <CABb+yY0SZuCQoLF65EGY0=R4=p7fO3SU53pPhT1cgAj26u8gNA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Nov 2026 09:14:54 +0530
X-Gm-Features: AclHuK_CabJq9g7mN5dukuhLCdD0ZSMtx534VbUmKJCoEfUVtt5Yuwt6FlaPoos
Message-ID: <CAAhSdy1dfRf97FACz-1hDaTJzB0jR2exXsWg+ttGCtbUmqmrcw@mail.gmail.com>
Subject: Re: [PATCH 3/4] mailbox: add direct synchronous send support
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Doug Anderson <dianders@chromium.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rahul Pathak <rahul@summations.net>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, 
	Radu Rendec <radu@rendec.net>, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 7:19=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> On Thu, Oct 29, 2026 at 7:27=E2=80=AFAM Anup Patel <anup.patel@oss.qualco=
mm.com> wrote:
> >
> > Hi Jassi,
> >
> > On Mon, Oct 12, 2026 at 5:52=E2=80=AFAM Jassi Brar <jassisinghbrar@gmai=
l.com> wrote:
> > >
> > > On Wed, Sep 30, 2026 at 10:06=E2=80=AFAM Anup Patel <anup.patel@oss.q=
ualcomm.com> wrote:
> > > >
> > > > From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> > > >
> > > > Some mailbox controllers can complete a transaction entirely within
> > > > the calling context, without going through the queued TX state
> > > > machine or a TX-done interrupt. Add a synchronous send path so thei=
r
> > > > clients can request one and wait for the result directly.
> > > >
> > > > Controllers advertise support via the new send_data_sync() op and
> > > > clients opt in by setting tx_sync when requesting the channel.
> > > >
> > > > Channels bound this way must not call mbox_chan_txdone() or
> > > > mbox_client_txdone(), and mbox_send_message() and mbox_flush() now
> > > > reject them, since only mbox_send_message_sync() is a valid
> > > > transmit path. The client remains responsible for serializing calls
> > > > to mbox_send_message_sync() against mbox_free_channel().
> > > >
> > > Seems like you want to use mbox_client.tx_block.
> > >
> >
> > Apologies for the delayed response, the past month I was travelling
> > followed by the Linux-7.4 merge window.
> >
> > We had tried mbox_client.tx_block method in the past and we had
> > found it to be not suitable because the mbox_send_message() will
> > use wait_for_completion_timeout() which crashes when called from
> > an atomic (non-sleepable) context. Our existing mailbox clients (such
> > as system msi, clock, etc) do mailbox transfers in an atomic context.
> > Due to this reason, currently we set mbox_client.tx_block =3D false &
> > mbox_client.knows_txdone =3D true in all our mailbox client drivers.
> >
> > Using mbox_client.tx_block =3D false & mbox_client.knows_txdone =3D tru=
e
> > still does not avoid the spinlock serialization enforced by msg_submit(=
)
> > function which works fine but adds unnecessary overhead and prevents
> > parallel message Tx from multiple CPUs to the same SBI MPXY mailbox
> > channel.
> >
> > The SBI MXPY mailbox controller driver simply sends messages to
> > higher privilege firmware upon Tx using SBI calls and when the call
> > returns the response data is returned with it. Also, there is no Tx com=
plete
> > interrupt. The higher privilege firmware may forward this message to a
> > microcontroller over RPMI queues OR it may context-switch and forward
> > this message to a secured domain (e.g. OP-TEE) to process the message.
> > The higher privilege firmware takes care of the serialization and also =
allows
> > parallel SBI MPXY calls from multiple CPUs.
> >
> > The MBOX_TXDONE_BY_RETURN and send_data_sync() callback
> > allows us to avoid the Tx queuing and "chan->lock" for SBI MPXY mailbox
> > channels since this is already taken care of by the higher privilege fi=
rmware.
> >
> 1) Your clocks can't really expect to be atomic  -
> rpmi_clk_enable/disable are prepare/unprepare callbacks which can be
> called from a sleepable context anyway.
> 2) System-MSI is a good candidate which makes me notice the shmem is
> per-cpu so currently a wider-scoped channel lock is protecting it. If
> you want lock-free access to the channel you need to guard shmem
> access with local_irq_save/restore which is anyway what should have
> been doing.
>
> For the system-msi case I think the framework can be modified to
> support it better. Instead of a prolonged back-forth I have drafted
> [1] support for a new lockfree api and the semantics documentation,
> because I also know how other platforms may benefit. Please either add
> pieces from it, or even better own it, adapt it and test it before
> submitting (even replace my s.o.b if the author wants). That will be
> the least effort for all of us.

Thanks Jassi, your changes look good to me.

I will include your patches in the next revision and also ensure that
these patches work with current RPMI drivers.

Regards,
Anup
