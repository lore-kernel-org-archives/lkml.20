Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793054554;
	b=uPRm68u5JEIBZy8wNjbX1Cb2BzKRibPyhbqLhgUZ5Y72/WVeqDsC5CAuB28XLsmtEu54
	 tmM7Kl3yaXAu73dwe9oKvCLNO8GNZdhGQMAcCO0rNUs+fFG6QfxLuC1kOZjnchBPL8WGd
	 Tr1L/TKk4cfkoRsa/T0Macc71DXQnfdma3tmoLAPzrEXJhr4MnIEaPoVhC/qgE43190b+
	 VpO7qEgCCXu7paox2R1qNFoFoMKMcnCsBtq+OciqBYY80dvt0rpgkepalMcJJ+AbSf8Mk
	 AFTFFUhQjvJBb80LfPNiplfQ4+zs+1HaTk0MwCiLEr9gMTbS/Fb1R6LMrxSvOZAWyrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1g41ScjhVwvRbzMcxKIfOWek1hrUNmo67dv5vjZ2E34=;
	b=c72YmWdhf+VfYxE2UaztZHbFB2THIhJ48x5uPb2Ysf7aitVkCkM59DylkfKJs75Ad96p
	 1qIY1+xtC5kbTLYVeexoFs0sokZHvkkbSKoKylMs+KNQnUYCbflGsQcfBv88NZpY4SyMC
	 ZoVdAD8/LFzpRj+Hrkmr9A4UxnkaZteLb3GO+7i2YipLOLO/55Tpy3UqQciFhbtMFJm4I
	 KRmR7kUGxWEvwdH0jAWZFKebHYMV6upa5PDTcLdcAaxa+pPYHqS+8RQFAv3wQIHW29q9K
	 SnV5rHif313wQThPytbhPN8sEZaNhAqKGD5sBF2rXxVehTMudibeh6WwG2bB2wYrHnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Ho8+h6Mf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCFF606A328
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DCFF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Ho8+h6Mf
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c43fbcb4393so495333466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793054552; cv=none;
        d=google.com; s=arc-20260327;
        b=J5bpYHF6MF1/dG9zxMCNOoNFA2fsjQHDtGnhv8YP6HUK4gqN6mZl/mVSgFyAT7JPyN
         MBWGQRWb4LoNQHLp3u7Q13L/zAry8wMWI5z4qjN/OORi1NReh0/A2NkU1Cso441nTHe/
         IZHg/e14AlobrEtckIt9kAS7Bac1zz2y230bg0XrYqZfGuinp7ye6HgLj/DdBY6hyYiK
         YALOZ2n5IAwD9LJhvUB8CFFWFyy6rorwXDFGgZ62KOdyJkJGP5iuxOLvBWmCRL5tD6uU
         3sp8qlmZY6hIzH1PpoPIOgVvcW5ZPSoFeQ74i3IG7+phljDb+wztDkePvfw6nUXhiTxX
         C8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1g41ScjhVwvRbzMcxKIfOWek1hrUNmo67dv5vjZ2E34=;
        fh=zF1LF8E3vXAlUolBJswOOmwwfT/IF53gQk4udR5YqcE=;
        b=XNELjT/BRAufWAm8tqZ/0O0zZTIxX1SOCJqyUiv7lxML5ik/94MV0/zKugEwuWQmLw
         +pMdqMJefwDoRXqDzptiBKZkQH2mGQAKuN6yP7hpxj305qsBauSPqDww6bD3qlfRj5Za
         2v7z5kyPqRvPZMeF4fS+4f7RecGO86hlDyuh8ShDvoIkqr5GeMngMK5sPlVQCqONF9DF
         FERekvpBsLZ8EDJ8LGo+not98eCpMq+P3gQCuJRJ/wrsJISdm+m6mA8pto00ifgs4AR1
         1dOrIhmgsK4ToIwHrTS5AOH8iGuy6/BOUTh39QW57JrOidYWo/IoxRMc6mLiPpfTQmJb
         ynxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793054552; x=1793659352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1g41ScjhVwvRbzMcxKIfOWek1hrUNmo67dv5vjZ2E34=;
        b=Ho8+h6MfzfNYBnYXWcB1Csn7RkH5FDAzc185C3faxOFFVI5Ip8rPZvUVVS9a7mPz36
         24gi8R8N3yA+KvfwmaRReqCQoQsNezGiPP1Bp7GiihlQBrxNS9eCbaY93g0l7+W+vIC0
         voQ2Heu+uMnZMYR6TuMnUotBhMhKn8fZO7YhZJ/VGMtSyWbiopW5EZJQ5vT2/6dOt2QP
         h6y7P/JEcSU5qhjYmxEPNqjJ3oooD2zuidI/sWorRbLSpg0w4GfbG7VlXLnZBZNxscre
         60kjozBonZXdnmTiD0g6qsMUd7kqNlcLdjiG7bhzjYU1/2dfEHHIUzSVvBAgpzwQCCET
         IiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054552; x=1793659352;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1g41ScjhVwvRbzMcxKIfOWek1hrUNmo67dv5vjZ2E34=;
        b=h2X8E1193k+AVzt7emNrSbc+7CSj8KqMXc1sJwXsbqmU5J1TeAjJ6ga6jWLAuuduJq
         ehjFSJYyJHzUdK7ehODg2SH1ruo8Vid2IoHRUk1fv+5u17lg7yfcYR86krfxyu0/M/3L
         zDIL+SFGjS35V/BgnrV98bWnXnBe3i+IVB3iAVTr5xSi4YF5XbMVx1cUdqWcGmOCgixT
         Fmm0Q3qBl4WmrzwsipBzVH1Ehd7zr4ExpvwHAfIfEENhDpyibq1zn3zzntq2HSL0qUMm
         h2GkRa2U7jkiogv3RB4Mw9ywmE/toAtrtIZ/xer8qQuQhgB7qOiGJcwpK9zQ++hEhUPj
         5B9A==
X-Forwarded-Encrypted: i=1; AKwUvBzlAlDo3gJfVzgTj0VxtLhe5sWQzZKr03VAie1lu41z++ORfUk2qh4A+VjsoRguUactTOgACtq8ye3Twbc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ08lbYzxlbHJalkubChFugEHZrs7r6i6v1ASIJDwBcOzjx0kUv
	+VfPxI44qAJNHpW5x+EOr8prCFaemkKl/6r1ynh8Ue3itm7A88ND8NUw/ZtDnL3js+H8n6RDA9F
	DRBXP/sbsEJe2BxciiLXivCb5wK3KmgeTUlfsghfYmgQifLXVytejEeRU
X-Gm-Gg: AYBFou0gJj1IEVeOjGF0nKrjkFIwofRhldrpGZUL6UBg8dKOOV7MFcq4MeaFYbNuecg
	5b9ZjGdF22DH1dL59fRdR0bJjVckWLzJXDDn9ZmknW9xaBhai9IZ6T2fw7qS66ZwBamHXdCAVJ5
	+6pFU+jrel2UB/7s4TmeUJuMbQxSCfUHTdIA0KF3+3G0iu70IdK+Yuk3pjkcSxC7FCFY8vHiyZO
	etWHRRK7Wgv6qYlchBLL8Cp0n/nl6BV6Ki5H4lSoSMVhkq3msq8ZZw2mCcTtopkYVtlzAv2TiX3
	XIeEBzNRbk4psPD8J/jJpRtT/CfNrZVrTimIEJvADD3HEFra+M//FrcyoBntr08d5mL01lHY5B5
	aowXGH5oWhFlF4VrgAajis0kTLrsfidAxKNrErQX056cow32OrHbg7Xjv/Mm6iRjZGw4iCGMloU
	ryIKh0tgdPP758ap/uyyTGjTN2Pa7+nsy8NP5XWK2Zxb2Womtfaim26dVTPBqc/6jhNSEXVIdkV
	VJJ74g6
X-Received: by 2002:a17:906:4fcb:b0:c46:8733:642b with SMTP id
 a640c23a62f3a-c46bdeba20dmr991156866b.43.1793054551213; Mon, 26 Oct 2026
 15:42:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026215226.3713941-9-jthoughton@google.com> <da7bb91d95914febc9b2b981c0b8292022d6f6437ecb68ed2b717f0f4a3a04c2@mail.kernel.org>
In-Reply-To: <da7bb91d95914febc9b2b981c0b8292022d6f6437ecb68ed2b717f0f4a3a04c2@mail.kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Mon, 26 Oct 2026 15:41:52 -0700
X-Gm-Features: AclHuK9NQf_DmtP280VFWB18VLK39ZMzdxZm9Qsh_-4Snm7U1eOCkiznChHcSHY
Message-ID: <CADrL8HXA3KVX9agtcExpPuaBLC-zAEWx6QgsRnQ6+cb4AZZrFQ@mail.gmail.com>
Subject: Re: [RFC PATCH 08/10] uaccess: Refuse and warn on __copy_from_user_inatomic()
 without an mm
To: bot+bpf-ci@kernel.org
Cc: akpm@linux-foundation.org, viro@zeniv.linux.org.uk, tglx@kernel.org, 
	peterz@infradead.org, kees@kernel.org, arnd@arndb.de, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, seanjc@google.com, pbonzini@redhat.com, 
	jmattson@google.com, axboe@kernel.dk, asml.silence@gmail.com, 
	James.Bottomley@hansenpartnership.com, mkp@kernel.org, dsterba@suse.com, 
	mason@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, jpoimboe@kernel.org, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-btrfs@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andrii@kernel.org, martin.lau@kernel.org, 
	eddyz87@gmail.com, yonghong.song@linux.dev, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:30=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > uaccess: Refuse and warn on __copy_from_user_inatomic() without an mm
>
> TL;DR: Commit message only: it names kvm_read_guest_atomic(), which no lo=
nger
> exists in this tree; the review suggests kvm_vcpu_read_guest_atomic() ins=
tead.
>
> >     uaccess: Refuse and warn on __copy_from_user_inatomic() without an =
mm
> >
> >     __copy_from_user_inatomic() never called should_fail_usercopy(), so=
 the
> >     NULL current->mm check added to uaccess_should_fail() does not cove=
r it.
> >     It is used e.g. by KVM's kvm_read_guest_atomic(), by several
> >     architectures' perf callchain and stack trace code, and by the gene=
ric
> >     copy_from_user_inatomic_nontemporal().
> >
> >     Split the NULL mm check out of uaccess_should_fail() into
> >     uaccess_without_mm(), and use it in __copy_from_user_inatomic() to =
warn
> >     and refuse the copy.
> >
> >     Don't use uaccess_should_fail() there, as that would also start inj=
ecting
> >     failures into __copy_from_user_inatomic(), which some callers don't
> >     expect to fail in practice, e.g. __wp_page_copy_user() warns if the=
 copy
> >     fails twice.
> >
> >     copy_from_user_nofault() already fails quietly when current->mm is =
NULL,
> >     and the generic user stack unwinding entry points (perf_callchain()=
,
> >     get_perf_callchain() and stack_trace_save_user()) only unwind the u=
ser
> >     stack of a user task with an mm, so neither is affected.
> >
> >     Signed-off-by: James Houghton <jthoughton@google.com>
>
> The changelog names kvm_read_guest_atomic() as a user of
> __copy_from_user_inatomic(), but that function no longer exists in this t=
ree.
> It was removed by commit ef82eddc0e31 ("KVM: Remove kvm_read_guest_atomic=
()").
>
> The KVM user is now kvm_vcpu_read_guest_atomic() in virt/kvm/kvm_main.c,
> which calls the static __kvm_read_guest_atomic():
>
>     static int __kvm_read_guest_atomic(struct kvm_memory_slot *slot, gfn_=
t gfn,
>                                        void *data, int offset, unsigned l=
ong len)
>     {
>         ...
>         pagefault_disable();
>         r =3D __copy_from_user_inatomic(data, (void __user *)addr + offse=
t, len);
>         pagefault_enable();
>
> A grep for kvm_read_guest_atomic only finds __kvm_read_guest_atomic() and
> kvm_vcpu_read_guest_atomic().
>
> Could the changelog say kvm_vcpu_read_guest_atomic() instead?

Yes, that is correct. I've applied this fix in v2.
