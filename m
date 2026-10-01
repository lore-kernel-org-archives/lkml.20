Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71D6486430
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860941; cv=pass; b=YBIlas724KZQNx34PTdtANVCuAU45AJ86gVdpkZuM0Kp0/po/HiozeY1atmYEZDZQvE3vq1+OpqxYOl0vZbpacHtQPpVu8y3ZI3q+Dfh03+tB79kT7Sv4jY0qECes3se5Cd//orZmks1Db/rJFj1nf8mFwWZmyZVojrEpFo1VDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860941; c=relaxed/simple;
	bh=78/I5e26ZwbVehIXchEr6t1Tcum/dDjsYpzBkOUKW/o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=EtcaW2R2qnlENKNQhUBFCsqC34Okgifeg8DPTfKfHLX6kBloJO5xiLuwLUcjtx4Lu6/GhrTsB8PBHL7wHG8XFbbuQz/Whd+Xe3TCiPsesFzaO9chBsByLzufTZWsW/LKwxGFFdqE+q8IfZ3UnUj+shbADFbmQ2B+ZugN6SgFOcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfRbWDEM; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfRbWDEM"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3ce4795aso2387164e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790860937; cv=none;
        d=google.com; s=arc-20260327;
        b=MrYfZyY7Gm+/+CJu40WJbZuKEOudY48hjScS0LfxE565ahzyL6xzU0ISVCtsInRShU
         b1IBHzhHNJtTMB24TCD5KdHaKXCsDc8GoEpe8EoCl89mKEBbgS9OOlis8o1CWk7oFOVA
         eYgSiflh1F+wYu0xDYJUf39mGeKqAadtJjO9mqoKlT9+UJWJ/caMjS861DyWKNO0aAK/
         1bzof+1IXHOugktFW4NBstGm7HGhF9AFnM2eC/aUdZL3SGLwk4RQgZMCrRn3ZSf/T+ph
         LkUWLLtkLAwJbdBm2jsmm3G8GP9PF0J790e5dVfNs2JUMtRu6ZVqw+dn5RSMXYRfhJaw
         eTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=K2rfJ01ZmGaI0lA0v/3MNSwoPVIz18AnYTQDPM+ttlY=;
        fh=jfQx5dsgcEPBHsIyfzfw4uQJZMIRz/Wuek0aPlMPgIc=;
        b=oUWYxllWcU/x5iC+tvk4UCE0mccxHJyNZMqShjDhFL0eqnVtK4J5pVhAkAJEWkJI8g
         QGY2OvIiUl58rBZmEjRbqhfFxoqaAMONqBu80+VHnEBORVBvh6N33qy+WmSc4cn16Ri/
         Ins+fIy3z92FC4nZTjDBi118WMv1Bi7yRSdt7KTmJKK7Cl3f2GPFeyDCCHuGD0TYxWWV
         FSioWND9QPP098NCjyLmfC5Ccfnz8yVzjzfklG5faZm8FEF7+eveHck7TBfVw+BiWEhB
         2MD6+vhYwTBXz30JLje3OsZIOVWIkFHhx9+LstTHcvUNFCvSXShj2IagUPzQaaObf2hD
         yPTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790860937; x=1791465737; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2rfJ01ZmGaI0lA0v/3MNSwoPVIz18AnYTQDPM+ttlY=;
        b=HfRbWDEMYZP3uG7C7QAkh2KC0Vr4cqVz79acH1bwAnRxH+cTidaRxkdaQjjQ/wKY9B
         MM1Rvc4QtUjzHrcsgkrQe2WhLItGJpZDBMDaLVn5nr6avJoLirEy/7vn7lbjdSqIIqwd
         P65JPgvMNDw9/eugH+RUUoDyxeapIUeXCdGfNdRKAMQQqFYXVzksM345grEzn/OJ7AK7
         65JlyZp02RdI1nc2y31lYlA+bW7TiVcs9yqgbdnlnwQhE7lmLm07LfAI3eNc4Thf3XWU
         CQiwSCZGJ4RUc5DjQcOAx0UZI1plKDEITTK3fNJiXiXKkwFU86vOKuaaH5jvjCUfy2SB
         sAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860937; x=1791465737;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K2rfJ01ZmGaI0lA0v/3MNSwoPVIz18AnYTQDPM+ttlY=;
        b=U46QotI0Y0vVawuyNnZri0mwkPqERxO+1amQPtkKzgvVQyXS9l9LX5+ips353N8cer
         MkKHs5auPfLYBdC725QhOTQu1ABtlVEMIEvmCgBZf1Om4pmSssGrwUSsAthTfAGF9c+Z
         eZThjn8byeZGuLp7sKzIAvqTLyBW1C4E2GeLjX+A4pBcIQBw8DWY/J3jdRNCSOzoEuh5
         EsG0AO9g/G2lvYbRlrtlI7LqeWleAO3JCxMMeaqOZ4h+l3+ynpKTKrjjQFHyniCBODT7
         fKdvInTtKVMuhuN8EaRX4mUsp0gm4pTsDd2zSdbJ60z9pQwEeKyN0DxFXuU78CX31NPj
         iocw==
X-Forwarded-Encrypted: i=1; AKwUvByAggaobvn0hkqWnYqbPDklqTT96FoNmmU6KWj8LQ/deqWFhCPKKnOjIt/6MraiQjPkRy07gOCuH7xAmhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiTANX8/mJ19JyAZqReKLNUO3WE+0Pf6qwQdec+X1nXcgLFIhD
	oU/BayxP9IszqHr6fEIO1Gi4KCod+D/VY9CqZZh19DNM+MMmcAsXlpWCqu1411imK/9tO48r5k2
	dw8UcQakRlGu8LgA+bwwuwHdDN3VPdMQ=
X-Gm-Gg: AYBFou2vgSVAU0XBnBfu4QDMJKoVPzs0iOpQ3/4/OEeJHtfApFnLFTAaUNn3RuLOzrW
	3Qr5K8g7BHNIeWn/OOpqVHc7TZhCM/s9OfwyYNFoojnk6jmzOAQIW82YzUN+tIuxKle/O9DMCVX
	o/mPpVLQSKD0CZ/hpmDm9o6clCVCkAVpJSnDEfWbc8F4gJyRrn71jm6E4OFllXZ9ttyhMeN4Jqe
	Ezpdc06ezvtORcVGG8O1g8/PL5LcnH8k0Ca91aVytjWKURIDIinKvKzFBABz4SFDX8oyCpAtA5+
	j17cBC2grCiEYQpU6oMyBhfE3UEb1X0rqn/I66sR0F7+ORBqPc5Set1wm0WEyEMAkXKd5ieLZcj
	FsOcQ2d6mZNs4alwjRw6wocrfYrMo0zzx6wjC4qoOEck=
X-Received: by 2002:ac2:489b:0:b0:5ba:3f72:3c62 with SMTP id
 2adb3069b0e04-5ba405f52admr1422184e87.60.1790860936988; Thu, 01 Oct 2026
 06:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?RnLDqWTDqXJpYyBNQVJJRS1KT1NFUEg=?= <fredericmariejoseph@gmail.com>
Date: Thu, 1 Oct 2026 15:22:04 +0200
X-Gm-Features: AclHuK_MOX7JfudlMadfinPXwQiLq7XJSKPEd-fNTy2tC8RCJCyrCY6xzZk5HhE
Message-ID: <CAHD2OOfP=h=qS6nP4dtn7RTQqMEqOvXD+iURXJ7Rgc5KFjgi5A@mail.gmail.com>
Subject: [PATCH] x86/its: Make ITS thunk pages read-only without the ROX
 execmem cache
To: x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000fdf55f065cc74db2"

--000000000000fdf55f065cc74db2
Content-Type: multipart/alternative; boundary="000000000000fdf55e065cc74db0"

--000000000000fdf55e065cc74db0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello to list,

That's my first post so I hope I do things right. I found what seems to me
like a bug, and worked with Claude to find a patch. Hope it will be usefull=
.

With CONFIG_MODULES=3Dn there is no STRICT_MODULE_RWX, so x86 does not
select ARCH_HAS_EXECMEM_ROX and execmem_restore_rox() is the stub that
returns 0. its_pages_protect() relies on it alone, so the dynamic ITS
thunk pages, made executable by set_memory_x() in its_alloc(), stay
writable and executable for the life of the kernel. CONFIG_DEBUG_WX
reports them on every boot:

  x86/mm: Checked W+X mappings: FAILED, 7 W+X pages found.

The attached patch makes the pages read-only with set_memory_ro() when
the ROX cache is not built; when it is, nothing changes.

Tested on a CONFIG_MODULES=3Dn x86_64 build of 6.18.53 booted under
QEMU/KVM: with the change, the boots report "x86/mm: Checked W+X
mappings: passed, no W+X pages found." and no warning. On mainline
(551c722f4), whose its_pages_protect() is identical,
arch/x86/kernel/alternative.o builds without warnings with that
configuration and with x86_64_defconfig; mainline itself was not booted.

The bug was found, and the fix and its message written, with the help
of an AI coding assistant (Claude, Anthropic), and reviewed by me.

The patch is attached in git format-patch form (my mail client would
damage it inline); it applies with "git am". I can resend it inline
with git send-email if you prefer.

Fixes: a82b26451de1 ("x86/its: explicitly manage permissions for ITS pages"=
)

Regards,
Frederic MARIE-JOSEPH



Fr=C3=A9d=C3=A9ric MARIE-JOSEPH

*N=C2=B0 TVA intracommunautaire FR78788461903*
*N=C2=B0 SIRET 78846190300015/78846190300023*
*fmjconsulting.fr <http://fmjconsulting.fr>*

--000000000000fdf55e065cc74db0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"background-color:transparent"></span><=
span style=3D"background-color:transparent">Hello<span class=3D"gmail_defau=
lt" style=3D"font-size:small"> to list</span>,</span></div><div><br></div><=
div><div class=3D"gmail_default" style=3D"font-size:small">That&#39;s my fi=
rst post so I hope I do things right. I found what seems to me like a bug, =
and worked with Claude to find a patch. Hope it will be usefull.</div><br>W=
ith CONFIG_MODULES=3Dn there is no STRICT_MODULE_RWX, so x86 does not<br>se=
lect ARCH_HAS_EXECMEM_ROX and execmem_restore_rox() is the stub that<br>ret=
urns 0. its_pages_protect() relies on it alone, so the dynamic ITS<br>thunk=
 pages, made executable by set_memory_x() in its_alloc(), stay<br>writable =
and executable for the life of the kernel. CONFIG_DEBUG_WX<br>reports them =
on every boot:<br><br>=C2=A0 x86/mm: Checked W+X mappings: FAILED, 7 W+X pa=
ges found.<br><br>The attached patch makes the pages read-only with set_mem=
ory_ro() when<br>the ROX cache is not built; when it is, nothing changes.<b=
r><br>Tested on a CONFIG_MODULES=3Dn x86_64 build of 6.18.53 booted under<b=
r>QEMU/KVM: with the change, the boots report &quot;x86/mm: Checked W+X<br>=
mappings: passed, no W+X pages found.&quot; and no warning. On mainline<br>=
(551c722f4), whose its_pages_protect() is identical,<br>arch/x86/kernel/alt=
ernative.o builds without warnings with that<br>configuration and with x86_=
64_defconfig; mainline itself was not booted.<br><br>The bug was found, and=
 the fix and its message written, with the help<br>of an AI coding assistan=
t (Claude, Anthropic), and reviewed by me.<br><br>The patch is attached in =
git format-patch form (my mail client would<br>damage it inline); it applie=
s with &quot;git am&quot;. I can resend it inline<br>with git send-email if=
 you prefer.<br><br>Fixes: a82b26451de1 (&quot;x86/its: explicitly manage p=
ermissions for ITS pages&quot;)<br><br>Regards,<br>Frederic MARIE-JOSEPH<br=
></div><div><br></div><div><br></div><div><br></div><div><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>=
Fr=C3=A9d=C3=A9ric MARIE-JOSEPH</div><div><b><font color=3D"#999999"><span =
style=3D"font-size:x-small">N=C2=B0 TVA intracommunautaire FR78788461903</s=
pan><br></font></b></div><div><div style=3D"font-size:12.8000001907349px"><=
b><font color=3D"#999999"><font size=3D"1">N=C2=B0 SIRET 78846190300015/</f=
ont><span style=3D"font-family:Poppins;font-size:13px">78846190300023</span=
></font></b></div></div><div style=3D"font-size:12.8000001907349px"><div st=
yle=3D"font-size:12.8000001907349px"><b style=3D"color:rgb(153,153,153);fon=
t-size:x-small"><a href=3D"http://fmjconsulting.fr" target=3D"_blank">fmjco=
nsulting.fr</a></b><br></div><div style=3D"font-size:12.8000001907349px"><f=
ont size=3D"1" color=3D"#999999"><br></font><br><font size=3D"1" color=3D"#=
999999"></font></div><div style=3D"font-size:12.8000001907349px"></div></di=
v></div></div></div></div></div></div></div></div>

--000000000000fdf55e065cc74db0--
--000000000000fdf55f065cc74db2
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-x86-its-Make-ITS-thunk-pages-read-only-without-the-R.patch"
Content-Disposition: attachment; 
	filename="0001-x86-its-Make-ITS-thunk-pages-read-only-without-the-R.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mupkcpt90>
X-Attachment-Id: f_mupkcpt90

RnJvbSBjYTRmMTQ0MmYyZjI5ZGU3NzBmZDIzYjY2YWMzY2NjM2Y5Mjk1NzIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGcmVkZXJpYyBNQVJJRS1KT1NFUEggPGZyZWRlcmljbWFyaWVq
b3NlcGhAZ21haWwuY29tPgpEYXRlOiBUaHUsIDEgT2N0IDIwMjYgMTU6MDA6MDAgKzAyMDAKU3Vi
amVjdDogW1BBVENIXSB4ODYvaXRzOiBNYWtlIElUUyB0aHVuayBwYWdlcyByZWFkLW9ubHkgd2l0
aG91dCB0aGUgUk9YCiBleGVjbWVtIGNhY2hlCgpXaXRoIENPTkZJR19NT0RVTEVTPW4gdGhlcmUg
aXMgbm8gU1RSSUNUX01PRFVMRV9SV1gsIHNvIHg4NiBkb2VzIG5vdApzZWxlY3QgQVJDSF9IQVNf
RVhFQ01FTV9ST1ggYW5kIGV4ZWNtZW1fcmVzdG9yZV9yb3goKSBpcyB0aGUgc3R1YiB0aGF0CnJl
dHVybnMgMC4gaXRzX3BhZ2VzX3Byb3RlY3QoKSByZWxpZXMgb24gaXQgYWxvbmUsIHNvIHRoZSBk
eW5hbWljIElUUwp0aHVuayBwYWdlcywgbWFkZSBleGVjdXRhYmxlIGJ5IHNldF9tZW1vcnlfeCgp
IGluIGl0c19hbGxvYygpLCBzdGF5CndyaXRhYmxlIGFuZCBleGVjdXRhYmxlIGZvciB0aGUgbGlm
ZSBvZiB0aGUga2VybmVsLiBDT05GSUdfREVCVUdfV1gKcmVwb3J0cyB0aGVtIG9uIGV2ZXJ5IGJv
b3Q6CgogIHg4Ni9tbTogQ2hlY2tlZCBXK1ggbWFwcGluZ3M6IEZBSUxFRCwgNyBXK1ggcGFnZXMg
Zm91bmQuCgpNYWtlIHRoZSBwYWdlcyByZWFkLW9ubHkgd2l0aCBzZXRfbWVtb3J5X3JvKCkgd2hl
biB0aGUgUk9YIGNhY2hlIGlzIG5vdApidWlsdC4gV2hlbiBpdCBpcywgbm90aGluZyBjaGFuZ2Vz
LgoKRm91bmQgYnkgdGhlIFcrWCBjaGVjayBvZiBhIENPTkZJR19NT0RVTEVTPW4geDg2XzY0IGJ1
aWxkIG9mIDYuMTguNTMKYm9vdGVkIHVuZGVyIFFFTVUvS1ZNLiBUZXN0ZWQgb24gdGhhdCBidWls
ZCBvbmx5OiB3aXRoIHRoZSBjaGFuZ2UsIGJvdGgKYm9vdHMgb2YgdGhlIHRlc3QgcmVwb3J0ICJ4
ODYvbW06IENoZWNrZWQgVytYIG1hcHBpbmdzOiBwYXNzZWQsIG5vIFcrWApwYWdlcyBmb3VuZC4i
IGFuZCBubyB3YXJuaW5nLiBPbiBtYWlubGluZSwgd2hvc2UgaXRzX3BhZ2VzX3Byb3RlY3QoKSBp
cwppZGVudGljYWwsIGFyY2gveDg2L2tlcm5lbC9hbHRlcm5hdGl2ZS5vIGJ1aWxkcyB3aXRob3V0
IHdhcm5pbmdzIHdpdGggdGhhdApDT05GSUdfTU9EVUxFUz1uIGNvbmZpZ3VyYXRpb24gYW5kIHdp
dGggeDg2XzY0X2RlZmNvbmZpZyAobW9kdWxlcyBhbmQgdGhlClJPWCBjYWNoZSBvbiwgd2hlcmUg
dGhlIElTX0VOQUJMRUQoKSBicmFuY2gga2VlcHMgdGhlIGN1cnJlbnQgY2FsbCk7Cm1haW5saW5l
IGl0c2VsZiB3YXMgbm90IGJvb3RlZC4KClRoZSBidWcgd2FzIGZvdW5kLCBhbmQgdGhlIGZpeCBh
bmQgdGhpcyBtZXNzYWdlIHdyaXR0ZW4sIHdpdGggdGhlIGhlbHAKb2YgYW4gQUkgY29kaW5nIGFz
c2lzdGFudCAoQ2xhdWRlLCBBbnRocm9waWMpLCBhbmQgcmV2aWV3ZWQgYnkgbWUuCgpGaXhlczog
YTgyYjI2NDUxZGUxICgieDg2L2l0czogZXhwbGljaXRseSBtYW5hZ2UgcGVybWlzc2lvbnMgZm9y
IElUUyBwYWdlcyIpCkFzc2lzdGVkLWJ5OiBMTE0KU2lnbmVkLW9mZi1ieTogRnJlZGVyaWMgTUFS
SUUtSk9TRVBIIDxmcmVkZXJpY21hcmllam9zZXBoQGdtYWlsLmNvbT4KLS0tCiBhcmNoL3g4Ni9r
ZXJuZWwvYWx0ZXJuYXRpdmUuYyB8IDEwICsrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwv
YWx0ZXJuYXRpdmUuYyBiL2FyY2gveDg2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jCmluZGV4IDU4MmM2
ZDgzMC4uYWQwOGFjOWIxIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvYWx0ZXJuYXRpdmUu
YworKysgYi9hcmNoL3g4Ni9rZXJuZWwvYWx0ZXJuYXRpdmUuYwpAQCAtMTY4LDcgKzE2OCwxNSBA
QCBzdGF0aWMgdm9pZCBpdHNfcGFnZXNfcHJvdGVjdChzdHJ1Y3QgaXRzX2FycmF5ICpwYWdlcykK
IHsKIAlmb3IgKGludCBpID0gMDsgaSA8IHBhZ2VzLT5udW07IGkrKykgewogCQl2b2lkICpwYWdl
ID0gcGFnZXMtPnBhZ2VzW2ldOwotCQlleGVjbWVtX3Jlc3RvcmVfcm94KHBhZ2UsIFBBR0VfU0la
RSk7CisJCS8qCisJCSAqIFdpdGhvdXQgdGhlIFJPWCBleGVjbWVtIGNhY2hlIChubyBTVFJJQ1Rf
TU9EVUxFX1JXWCwgc28gbm8KKwkJICogbW9kdWxlcykgZXhlY21lbV9yZXN0b3JlX3JveCgpIGlz
IGEgc3R1YiBhbmQgdGhlIHRodW5rIHBhZ2VzCisJCSAqIHdvdWxkIHN0YXkgd3JpdGFibGUgYW5k
IGV4ZWN1dGFibGU6IG1ha2UgdGhlbSByZWFkLW9ubHkuCisJCSAqLworCQlpZiAoSVNfRU5BQkxF
RChDT05GSUdfQVJDSF9IQVNfRVhFQ01FTV9ST1gpKQorCQkJZXhlY21lbV9yZXN0b3JlX3JveChw
YWdlLCBQQUdFX1NJWkUpOworCQllbHNlCisJCQlzZXRfbWVtb3J5X3JvKCh1bnNpZ25lZCBsb25n
KXBhZ2UsIDEpOwogCX0KIH0KIAo=
--000000000000fdf55f065cc74db2--
