Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1EE403EB9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108954; cv=pass; b=md3AnVPgBKYlbgtFmxu43DpuQGWX0jw99Uk9qlA+7yLKOfJt1J61vmWAq4NFVk26dK9yWC7icogyseZ8wg2HB7aIPD99eZTcr9hLPwrlH2Ft76cSj18BKAvd4CAuGOJeh3MGL/GvEW/wS4W7sfgSnVpyJcrGJAfm6zDNmovZ4EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108954; c=relaxed/simple;
	bh=nl0WayBfnBzXB16tsQQ8C7lVQDuEYmE5cOfzxnYFlOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cW8yRdKoVprjrzvyyaEoCDrOuQkOiy6utblToke9Hr6kNduPMWHHjFXJSV1PO210PCyFOv2W1+QF3xgPkJYfik21bgOtZRANq9QsIcOYHM5+1TWRpfsKjSm93/4mVDPh2TtGiNsxvjLh4jjiheooDuXJOzO+cgcvZHOf0judF6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xz3lNUej; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xz3lNUej"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a9d74e8292so706a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790108944; cv=none;
        d=google.com; s=arc-20260327;
        b=gkeF+JBNvW0llzw/we44+qWLlNfC+USOMES6FunfCcZ0lRNQpFJ0da0+2OI3LH1exx
         eLdgiIRELMEC/VH7MhBFR2m8Guqvrr5YeJNaqW2ha7pfmNEiKeZ9AT6WmOs/shpkVrm4
         0Dtlr13IFijwGd10YmOW2Y/bmzmCuDaFqfKZYHmVwVtBn09x+xulRl5smDruvJZ0rnxP
         G3HJ6nDHhiQR7h+upk71zQswsxCrYFLnj0eDWSiLw0F5C2widAyuSqlPwnfHRhYKoHL7
         M0pI0nUBDpcMfm+qsA12aOS8ld6LRMKBKOsk4jjEOP29WnsT30/YiiBVUWhB8OLORGw6
         ISpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f4auqSnGVaI9/viQvIpi/oQzDocBQYdGMjQ8F0EupbI=;
        fh=CyhXtEmBwojfE1MXzIfYjOg9zxOJx4sv8S8OZjWMPZY=;
        b=IDNCXZfWyW0QLaXgLwKd46KyJ9M4tYfvg7bCeiC83UtWfW6KaUubG1mYST5oEX7xjB
         rw0TmcG+0MpCQtiWv/5GQMFDJpd8XOYvJO8tPxPRLiYriR/tLI8eesGWI4we+UgXcEaS
         gvG77zCM5mTGl8Mzu+0eqovsSVRSOAki3Nm2kHe4aR0vkXyQHmPpXznFjQr3lYq7nUIe
         sdfTxRI5TAkPSRapfNZbsSodwBX/4716ZVYYvSaDJSswt7vCWP5APb6yrJLk55ytIDBZ
         3SVm1jzuQlRDxEpNbQNSyY3YqUmsVLWoNQGnUY3AHOseXzcWPbjlrYsmIcEUOTY7eml9
         o1Dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790108944; x=1790713744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f4auqSnGVaI9/viQvIpi/oQzDocBQYdGMjQ8F0EupbI=;
        b=Xz3lNUej9X8VdZDr8tqKR2RBNQ8sjqxUZeWOZhQTAps9hA468+vYGp4qrb25FFAgX4
         GevH59xtPZy8XUwYStm65+wcB+kG49zfUUEUo+d3/JJR4FVrf+3C8JVYJhDoEaRGYUH6
         vyVI/Xd7elY9LlGnqji6588OhLgxDmxyED9rmSyF3zE12+KK9NXmpMMCieDzFmjIizff
         os3tQbObDZ3wudFkxlG5LRwlRvyAYs8llnK+Ue/v9Ga9Bcb4qmWOaCtCbMwL5rrtThct
         /mW5PCz2BAR6oBnCULgKWtTgMIUZgfv3voYk/U3Sktb+sMGey3rpCnRMFZngdV4gB/ZJ
         QoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108944; x=1790713744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4auqSnGVaI9/viQvIpi/oQzDocBQYdGMjQ8F0EupbI=;
        b=rtEnSbfaJ51rB5QQ6ifWOXQ5a2sYkbX8owTA/gvP2lE2o0MypFonXInu2WcMcVfxLK
         SAqS3mUTBmlEandkG/vagikh/DJHI7x27ETMKBfsf3RHlqJTTp8puUHDSkUPOy9HC35x
         F8usNh/NZeSpyqRtt0X7zCkDWh8z3ZkU4/zjSQpjpWR1t9cOUEPgwInUh+e261KqfcQW
         /6ojiJF1sRC/FfnddLpRfKFIzUB54cBC1WD0/lzBAEUlaECPfizB3G48PuHlnGKUzw+x
         7uybh1upE7bcnFVVZ7KH22wWd+B2Ehq0F1q7uHyQ0/2tF1AZ31ejAhb6kLhshpfR2/Pq
         wmJw==
X-Forwarded-Encrypted: i=1; AKwUvBzR35bEKLVkVHpDC8JQdyT3+CjSromYUxEw8RM/D3JalCA42Nz8cePZEjGwjOxslZsFtnhZbKPpywSneCI=@vger.kernel.org
X-Gm-Message-State: AFuF++ml/1VaeLvLhChkBItEPRJ+DOJOwisWPCtmoYChpS6DVTKN6KXP
	JyiAuet0wgBpGslmkWOntdPbkdbfCCe6vyQz52Ez4KKBdUxDAgIUVEw5GRcPWUViQvxrOFa0iA3
	i1ei1E8roqyyqAUfFNacq+IMpVdSa9ankaGNVoJ8=
X-Gm-Gg: AYBFou2nwJN3Bop8vptdlzvRkl/3axscpMtrYsPvsQ0AzenJwlCpzwpQqEM7WhgXwGk
	7tkdij8ja/q/2rDb9ahjq2K1aLBvvWilOYYut7Uoz49yiC1QHDOjCWie9WizwUkOUchdJhcmwRb
	hxAyM5nTtIB5naIrxm0eG3yvagOlrSY8hBfc609f4TT9kUmLRn2rA9RHICuxkYr5fQn5eK/Qfuv
	5ZDySLKu68dXSXeNdE9BcLAWy2Cfikm+yNLWzL3ZOY1RZiVrPC4txgiRwM4f3uoJJHfss6+JWhE
	sJrRXNb3DmU0elR2Kh5jhvJSFXh1H52OEzUfkETh2GCThX5qXPYW1B5M8O6G2K7iPNGYN9offSC
	/+H9UfGVf
X-Received: by 2002:a05:6402:683:b0:6aa:128c:36ad with SMTP id
 4fb4d7f45d1cf-6aab3b997d0mr10064a12.10.1790108943216; Tue, 22 Sep 2026
 13:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com>
 <0b2d8858-b361-4a64-986a-4c179210fbec@amd.com> <aqlWt4jb4CSPnecN@google.com>
 <d6179d34-a4b0-4548-8298-b790b333d22f@amd.com> <CAJxe5ctcVxmhRSw3Gt0POQTzRKoxXo7+Y3CPDe7cUZvC0QPK+g@mail.gmail.com>
 <aqrhFvwFJsQTaEkz@google.com> <CAJxe5csCb0DHZmJo9a-asXZ-tYdcyK1y0Y4Y9Uoixqn=sa8zRQ@mail.gmail.com>
 <arF9CXWC_UDYUMmf@google.com>
In-Reply-To: <arF9CXWC_UDYUMmf@google.com>
From: Jacky Li <jackyli@google.com>
Date: Tue, 22 Sep 2026 13:28:51 -0700
X-Gm-Features: AclHuK_mY43f-bAoEDGwDRGxsfpJ91_apKdGyjoPSuWVw4gI8ssd82nL_grfFCw
Message-ID: <CAJxe5csuNRcULSTeRRAq0GGQASTTpgwqOCXwNZJtApeZb_Va3A@mail.gmail.com>
Subject: Re: [PATCH] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer
 access failure
To: Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Jacob Xu <jacobhxu@google.com>, 
	Supraja Sridhara <suprajasri@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 11:53=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> No, kvm_vcpu_map() actually has far worse semantics.  GUP pins the *page*=
, it does
> not pin the userspace mapping.  I.e. kvm_vcpu_map() guarantees that KVM w=
on't write
> to a freed page, but that's literally it.  E.g. if userspace mprotect()'s=
 the page
> to make it read-only, KVM will write to what is supposed to be a RO page.=
  Or if
> userspace completely unmaps the page, KVM will write to soon-to-be-freed =
memory.

Sorry for the confusion. I didn't mean writing to the response page through
map.hva; I only meant calling kvm_vcpu_map() to validate and pin the page,
while still using kvm_write_guest() to copy the response back:

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4231,19 +4231,25 @@ static int snp_handle_guest_req(struct
vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
  if (kvm_read_guest(kvm, req_gpa, sev->guest_req_buf, PAGE_SIZE))
  return -EIO;

+ CLASS(kvm_vcpu_map_local, map)(&svm->vcpu, gpa_to_gfn(resp_gpa));
+ if (map.ret) {
+ svm_vmgexit_bad_input(svm, GHCB_ERR_INVALID_INPUT);
+ return 1;
+ }
+
  data.gctx_paddr =3D __psp_pa(sev->snp_context);
  data.req_paddr =3D __psp_pa(sev->guest_req_buf);
  data.res_paddr =3D __psp_pa(sev->guest_resp_buf);

  /*
  * Firmware failures are propagated on to guest, but any other failure
  * condition along the way should be reported to userspace. E.g. if
  * the PSP is dead and commands are timing out.
  */
  ret =3D sev_issue_cmd(kvm, SEV_CMD_SNP_GUEST_REQUEST, &data, &fw_err);
  if (ret && !fw_err)
  return ret;

  if (kvm_write_guest(kvm, resp_gpa, sev->guest_resp_buf, PAGE_SIZE))
  return -EIO;

Because the actual payload write still goes through kvm_write_guest()
(uaccess) rather than map.hva, a concurrent mprotect(PROT_READ) or
munmap() would still cause kvm_write_guest() to fail rather than
overwriting a read-only page or soon-to-be-freed memory.

> Who cares?  The guest can only hurt itself by converting resp_gpa to priv=
ate.

The only reason we care from the hypervisor's perspective is that
a post-command -EIO/-EFAULT exit causes the VMM to abort and looks like
a hypervisor infrastructure failure rather than a guest error.

That said, this only matters if a malicious guest deliberately races a
conversion against its own request. Given the complexity of a gpc and
that kvm_vcpu_map() is being phased out, the 1-byte tickle write is much
simpler and good enough to protect normal guests from burning their
VMPCK or killing the VM over a bad resp_gpa.

I'll send a v2 with the tickle approach. Thanks!
