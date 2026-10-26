Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030660;
	b=eR3UCvvtTLsAgyXjOLh6akWF2+j/URzgDHxnNmTClTNZDtBQLSiKC7/xelRTci1KbSgU
	 kbyxFmztqCb01GTQ8wHVxQFMz4SqXeIS1/BvhmYr7gXeyU97XmR2vJjGUH238zszCWoKB
	 pDulb66LZ+v6FS/VSyWTEQRLxmA2cZOms1CkexiKuMlT6aShG3eVb2jTWmmQhmfj2Qk0w
	 GTAitYrOWWyyxszijl+X07CmYY5l31WKbKUbFkPEbS9SvglWB7SjKllp1DOHH6pJMxB0v
	 kQTPv6GkF1dAhDy42n6v1hN8eZiu4JZ8eRifgceyKXx7zDlCcOBWl5y7GC0l7H3RvMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=BtlG9GazPDheIdOzNzDs4NZFQum26PeBlhzgVoUNI/o=;
	b=oiSMNRCuHKeR2yjL77nApoUTXzegdxDNd7f+vKn2IIe5GQkjs8KW4SiIToU7Z6MylbCT
	 vd9BUbfZ0nXKUy8JSNLfrmO+mIa2XKMCS1hGL7Ioa9PBQ20GEl/dYuFdf2uS8Dwv2pTlx
	 METbR7blz89hF2MTF376hfGHnpTMBMQ8xlWc52yECLXRRcSTQXiTMZIlJCn9UmjsU4yNQ
	 tLvNLXgQOdPDHUL8FScZ4RrxO8FDkDMidV5DWvEN0QtENbR2dSLA9wggz0QCn2VAcwvV1
	 9AZe2BNQQF1xd6BhDi7htUjYtjgmQx5iV+aAp6rUP6ycsYPr0KsAntOqgyVVFX3ZN5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BUTqpZmq;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A2E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A2E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BUTqpZmq
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso5156729a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793030659; x=1793635459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BtlG9GazPDheIdOzNzDs4NZFQum26PeBlhzgVoUNI/o=;
        b=BUTqpZmqz96ANztGzcjwFuJS4uRuTsaLFaxLx09DXbzdy0ACNLUfFKRgYojgw1tkID
         KkIDeF02IrlSnZagJ3sVarcvU2wtlkHd31wUE9D66+bE926A/RC+6cYXYGuqi9Us22qv
         47/YUFqrhIgCI3VERXohI1kZcMWPstYXtu41L9s8VJTrfOaXr1teX+uVI3LL4yThjLfg
         jAiSIlu7UTdu4l5sBItUbH4pvNuFdElEoAYws6LSIUuor+J3CdMaF0H+zigNh9rt2WPh
         rkSPsayMlw2LKDHPSk5mo20lEIAWrPKsPsMT3gR+zpZj0M9vYEGWm2tw1dVB1ac21HxT
         VoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030659; x=1793635459;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BtlG9GazPDheIdOzNzDs4NZFQum26PeBlhzgVoUNI/o=;
        b=c+ZhKen96yciUyqSrTkY1/duPhxm1xbtucYb8gicLGsrgg3XnYtmIe1Kr4mdCSdzDi
         6q02I1Vl/Nt2+WBaVHdI/dcpDf1E1xSZso2+3g4gLaw7I5TlynKPQ3roTXYic3iDW4rE
         oJDz0nHk4C/9LoZ4ImfhKmboww7H/3GxWaRrF1GBBy2/vjCAZzSokEPPAV6M5DO6zh5j
         vfrxf6DUed8bvne38BH3fnjNZnPrJszLQsRvX4a4agqZ/4dEHUZW3ap2kl4a8YgY3VPe
         9mDtsCCCY80pvxjKEP68bBegpvlpaZEAQkvK1idqDAK4BXze/SIsVMlg3NVYdSqnKnx+
         XxWA==
X-Forwarded-Encrypted: i=1; AKwUvBzNaKFyCW0jWxd4XphW1/Zs2QvSFCpwLusT7pyz3DmCAI6BQHRsd85eco1UuOVbXyGsyWoNov7BP6+lkVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlRE3pGCadBBQELE+so6UQG8mwO3FqNyNW2wJ4Ge5vHZV0q9K9
	hRrb43QMtMI1mDcu92w5sMbFdBjyAQutoi34oG9IvEMiHYjrqXNaB9gtTlzxUhrU79sRLJ1Fwoq
	M/K44Bg==
X-Received: from pjbmq5.prod.google.com ([2002:a17:90b:3805:b0:3ab:f091:d7bd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c88c:b0:3ac:7c4d:8be1
 with SMTP id 98e67ed59e1d1-3adeb1622d2mr5782528a91.62.1793030658656; Mon, 26
 Oct 2026 09:04:18 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:04:17 -0700
In-Reply-To: <9467c7b6-d797-4462-bee1-1406bb8469cd@zytor.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260911213659.2025974-1-sohil.mehta@intel.com>
 <E7D55C5F-91DF-45AC-BCC8-BD2759CEE0C4@zytor.com> <9467c7b6-d797-4462-bee1-1406bb8469cd@zytor.com>
Message-ID: <at96Aex_dl8-yUk6@google.com>
Subject: Re: [PATCH v10 00/28] KVM: Enable FRED support with KVM VMX
From: Sean Christopherson <seanjc@google.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Xin Li <xin@zytor.com>, Sohil Mehta <sohil.mehta@intel.com>, kvm@vger.kernel.org, 
	x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Shivansh Dhiman <shivansh.dhiman@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Chao Gao <chao.gao@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Zhao Liu <zhao1.liu@intel.com>, Yosry Ahmed <yosry@kernel.org>, 
	David Matlack <dmatlack@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026, H. Peter Anvin wrote:
> On 2026-09-14 23:03, Xin Li wrote:
> >=20
> >> On Sep 11, 2026, at 2:36=E2=80=AFPM, Sohil Mehta <sohil.mehta@intel.co=
m> wrote:
> >>
> >> I mainly rebased the patches to the latest kvm-x86/next branch and fix=
ed
> >> a handful of issues reported during internal testing and basic AI
> >> reviews. I've avoided making any major code changes or commit message
> >> updates as this is the first iteration that I am posting.=20
> >=20
> > Thanks a lot for taking care of the patch series.
> >=20
> >>
> >> Going forward, based on the feedback, I'll rework the patches as neede=
d.
> >> I've listed a few opens below that need additional discussion or
> >> clarification. I'm relatively new to the KVM subsystem, so please feel
> >> free to provide suggestions on the series structure, code organization
> >> as well as commit log clarity to smoothen the review process.
> >=20
> > I=E2=80=99ve been thinking about an optimization: because FRED drops mo=
st of the old   =20
> > syscall MSRs (IA32_LSTAR/IA32_CSTAR/IA32_SFMASK), we should be able to =
omit    =20
> > them from KVM's uret MSR tracking entirely as if host enables FRED (no =
matter  =20
> > whether a guest uses FRED).
> >=20
> Yes, although they will need to be handled properly between VCPU switches=
, of
> course.

And we'd want to keep the optimizations to elide writes when vCPUs are usin=
g the
same value(s).  So, compile tested only...

From: Sean Christopherson <seanjc@google.com>
Date: Mon, 26 Oct 2026 07:37:03 -0700
Subject: [PATCH] KVM: x86: Don't bother loading host values for SYSCALL MSR=
s
 when FRED is in use

Elide the WRMSRs for the SYSCALL MSRs when returning to userspace if FRED
is in use, in which case said MSRs are never actually used in Linux.

Note, KVM never saves/restores MSR_CSTAR via the user-return MSR mechanism,
as the MSR is unused by Intel/VMX hardware, and SVM unconditionally context
switches the MSR via a dedicated VMCB field (along with all other SYSCALL
MSRs).  Include MSR_CSTAR to provide a contiguous range of values in the
case statements, e.g. so that the compiler can optimize the case statements
into a simple bounds checks.

Suggested-by: Xin Li (Intel) <xin@zytor.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/msrs.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
index e91650af44c2..ef3596d8c780 100644
--- a/arch/x86/kvm/msrs.c
+++ b/arch/x86/kvm/msrs.c
@@ -65,6 +65,23 @@ void kvm_destroy_user_return_msrs(void)
 	kvm_nr_uret_msrs =3D 0;
 }
=20
+static bool kvm_is_msr_used_in_host(u32 msr)
+{
+	if (!cpu_feature_enabled(X86_FEATURE_FRED))
+		return true;
+
+	switch (msr) {
+	case MSR_STAR:
+	case MSR_LSTAR:
+	case MSR_CSTAR:
+	case MSR_SYSCALL_MASK:
+		return false;
+	default:
+		break;
+	}
+	return true;
+}
+
 static void kvm_on_user_return(struct user_return_notifier *urn)
 {
 	unsigned slot;
@@ -77,7 +94,8 @@ static void kvm_on_user_return(struct user_return_notifie=
r *urn)
=20
 	for (slot =3D 0; slot < kvm_nr_uret_msrs; ++slot) {
 		values =3D &msrs->values[slot];
-		if (values->host !=3D values->curr) {
+		if (kvm_is_msr_used_in_host(kvm_uret_msrs_list[slot]) &&
+		    values->host !=3D values->curr) {
 			wrmsrq(kvm_uret_msrs_list[slot], values->host);
 			values->curr =3D values->host;
 		}

base-commit: 7e60162b16f9da0d2fa83da5c1723b6853a0ac1d
--=20
