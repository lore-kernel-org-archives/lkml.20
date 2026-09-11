Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE25338C415
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149372; cv=pass; b=LzECCptw3qttsuq+fAo1U80C4rX1Hy1tHJ0AraAbYSnnwtbqdxLud7lZwkBp9yvLPEdmh8Pg0R2wDSaB5qrZ3aq4Kj2AKH2ZKqZioRbIV19UujrDa48X02TT+/JuMjPeY/66Cg6rH3tzLZTH6GZgvnitOdG8nMLiSNUfHjxlqms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149372; c=relaxed/simple;
	bh=fJjyrLQ1Z1Tf2GwJXj7w6sCJckyGaAXTzUCJHhBTowA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JV/i5tI5nG8cwtHHoLoaHQilAI7gJZ3rUfdKAbSTCs3cVKh+3D8IzN6GzHIglJRRLSsI6gyM85YIW87TCrve4zJdtnbaeA+SgxaOytAFUMeQT5xq8OkMaHtVXb+y3iDnO+FtdZSonB9hQezefZFCOtTu6dAWcfgdolD9cgEqANM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=ZpzTAeH1; arc=pass smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="ZpzTAeH1"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-39d78580bfdso826898a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789149370; cv=none;
        d=google.com; s=arc-20260327;
        b=LMf3YRzbsmLpeeh8p1bAWMen3kF8hN8RXbKj31tPWy/J52iB7yrJXvqMx2EzjrLL5R
         KrPK7D/SVWHuWX4A099BwZiwRuaWv6v8ePY3in1Agrm/5FWLq/Ncid3s/W5NOK+S5zMH
         7On+6eBUVr3ydnP+UKgN2XYEr3iAVVz7umVySKuFcV/l+et8dijJ/uch0q630Ayvlgaf
         5u3U865fY5zn8pOFIRUxn/vyrazD5j2Q5NwF7Cq3oFZ4b6ebygrmYHdezq9rS5gpDKXa
         IbhVHLIPAoU3iAn22nUN0EGeTVyxp/KEGIMRMN0Cr930WeRMv2H34fYyRlW5RxKAVYWA
         7EhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SavJPJ4KSHTrBfITiLHc5tW6JxlXCmYJvHbElcFUSeA=;
        fh=ctKjnww3vEyCGbWmYrHLtst5/2H5lhkvpnkYYqXIwaI=;
        b=V/u9Xi6OVfkM3s5Unm+Fwnb9yGb8FdEyjw9sDxVjO2qztqv5D9l7cHIw26erms2HkO
         gDO4Ir4H4EK2ixSsYh7OErxLJEneqfxkZRCPzt/6qjqoohYRKjHKxABNbCQYT/pdKAuB
         PIU0cS3CXOXWPdRmmLR1CUN6yep7qGauYrZvDOKgbIKayVpzEf1TpQCvD050FjJLW2kn
         BMGEszQNsJlfpRuEzlG3HGnsWPMpx9Efj8to+K/Ld/sOciUpBu+qsuqnNIex5w35mpDh
         RDqzXSVsre0VnQF0mXhmHaQ+O9GwzbN81WY6GlvDw8TDUcjko4mZi5YjMXMaQXP/S2tx
         W9Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789149370; x=1789754170; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SavJPJ4KSHTrBfITiLHc5tW6JxlXCmYJvHbElcFUSeA=;
        b=ZpzTAeH1460hZdHp7mvISQ75/QxN7F0+nQpXGUOiTrfQUSNIO4sNpz/e6Un1nnqP+6
         Z4Aicde7hRi3uQ4Y6XPBtuOD6T6sywCtEqdRM50A2OdZ3aCUjJzPNMmgOokXJzeXEcZd
         /GX5AUYfZ8sffXAOdmbOf+LQF5KuoHeM8Xo7UUroimYoc45XB7xstw6eAvFiH+dGGLnS
         +VNwsnQZhuYLRi44UxdPIxiw+buaoQqJJZvhKt7pOWQ70dDIwpyqCiwLE7qmnvMYZyuF
         PI4LV6HdBvkMfSuNl0dY+ikeaxyY0paETlAz9XZBVOfuRaD0gIeAP06Qa1KPu/qu4tAb
         c4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149370; x=1789754170;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SavJPJ4KSHTrBfITiLHc5tW6JxlXCmYJvHbElcFUSeA=;
        b=lMM7AdO2dkpwtUzgOuF72E1sEOdU33nF/1U5btzGOa6LcRmkojLmQmifzYsJGff3e3
         DrR2asJYOUc0Q0pJdjzaKnVTXery7qXUPri9CsybKy3bkaB82gnC5pm+xqLjnyJX2xIA
         qkH3NUVkbOFxMZWXeWHA56PfuRJa1quSqnw13lavWoN0NFfbY0XIkB68s2vtdHc59bDX
         CHJ+gCQBH6rCJVSikkLLZbSu60/ilQTuX4y2YyuBjhtbDnb9ODHWwu+vySoET0hZv1SA
         6Ux/UT5HdsHHEibPyrauUwBeGd2NydszzAIPrUDmIc4jcJJafCTn6YrVoNevZXXZzCqW
         3DtQ==
X-Gm-Message-State: AFuF++nY4kSthxnpX4k7wWG3sR8w1ytBua8nDrL3uW0wio0Sasi9nVWp
	jn4eEoofZDGFZvP0PIs9lEK4yBj6kaOm1b4xKCOzoI2v0ic91Pg/oQV435kG6gZ8Yu9ngZKDlvz
	OsxspeAdC4TRummfQE72begWxKkLnSIgi1EGdMMsP
X-Gm-Gg: AYBFou3deE3b+juncZMsI2RxjRM+B6GqPJWac0PHSfjMJcRMSxaMK8oYblZjKhFeY0j
	DAT4PRRqdt8qvC6AVAwj+3Z++pE5jmvSCpmhm9jxM/+lfVQEhc/iZ3JuYlp7xXPC1Y0JZuEXblr
	A/Ih8+2uZpjUIZL56BDhzJqXeHyHRUaOjVEyTzvst6/rR0F4a00FPbqFJW4iLjq5POfSWbLtNQJ
	8Gve6Pi9AGl9n6ghWo14uFLsa4IYVoKxH1nE2EL/BjfTesmmiq2LaWnLg16BtVPjU9V6TYoKkzO
	60bKi12k9CaD/dS5xNvEsiQ8qV3oD4wcFsn7nMEc9cXoc7lloYShnJDKeDwXB6mlAZK0KKMRA5c
	qocS/xQkOILC/HQiPgm1Dm4VJFls6Ql3nEgC1KKDXYB81Cu+Q2t4ehqqxxQnV+vNWqzIwgMjriH
	I=
X-Received: by 2002:a17:90b:3d4e:b0:39b:2c00:c3f5 with SMTP id
 98e67ed59e1d1-39d9c345f58mr9169419a91.18.1789149368883; Fri, 11 Sep 2026
 10:56:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 10:55:57 -0700
X-Gm-Features: AcwNN1VvHYZSqWHMdS_FRQFRAR9bpEW5KG-FQ_f1CPViuVL42Micg3FkvM4KQkM
Message-ID: <CA+0ovCgeJW1kbBvaKhfG+braJKSwgLJKvRLsq7MtjhZn6QNK2Q@mail.gmail.com>
Subject: [BUG] general protection fault in usbip_recv_xbuff
To: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>
Cc: linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000961557065b38cc00"

--000000000000961557065b38cc00
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   43.862608][ T9503] KASAN: null-ptr-deref in range
[0x0000000000000118-0x000000000000011f]
[   43.863617][ T9503] CPU: 0 UID: 0 PID: 9503 Comm: vudc_rx Not
tainted 7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   43.864586][ T9503] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   43.865607][ T9503] RIP: 0010:__dev_printk+0x6e/0x190
[   43.867655][ T9503] Code: 00 fc ff df 49 ff c7 4c 89 f8 48 c1 e8 03
42 0f b6 04 28 84 c0 0f 85 16 01 00 00 41 0f b6 2f 4d 8d 7e 68 4c 89
f8 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 ff e8 63 c7 1b fc 4d 8b 3f
4d 85 ff 75
[   43.869424][ T9503] RSP: 0018:ffffc90007987aa8 EFLAGS: 00010202
[   43.870016][ T9503] RAX: 0000000000000023 RBX: ffffc90007987b40
RCX: 000000008c764501
[   43.870738][ T9503] RDX: 0000000000000000 RSI: 00000000000000b0
RDI: ffffffff8c764560
[   43.872458][ T9503] RBP: 0000000000000033 R08: ffffc90007987b77
R09: 0000000000000000
[   43.873303][ T9503] R10: ffffc90007987b60 R11: fffff52000f30f6f
R12: ffffc90007987b20
[   43.874080][ T9503] R13: dffffc0000000000 R14: 00000000000000b0
R15: 0000000000000118
[   43.874817][ T9503] FS:  0000000000000000(0000)
GS:ffff8880d7388000(0000) knlGS:0000000000000000
[   43.875620][ T9503] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   43.876214][ T9503] CR2: 000055f3e6a0e240 CR3: 000000010f232000
CR4: 0000000000752ef0
[   43.876936][ T9503] PKRU: 55555554
[   43.877267][ T9503] Call Trace:
[   43.877581][ T9503]  <TASK>
[   43.877861][ T9503]  _dev_err+0x11e/0x180
[   43.878251][ T9503]  ? __pfx_usbip_recv+0x10/0x10
[   43.879498][ T9503]  ? __pfx__dev_err+0x10/0x10
[   43.879940][ T9503]  ? rcu_is_watching+0x16/0xb0
[   43.880386][ T9503]  ? trace_kmalloc+0x2a/0xf0
[   43.880819][ T9503]  usbip_recv_xbuff+0x547/0x620
[   43.881332][ T9503]  ? v_rx_loop+0x685/0xd90
[   43.881791][ T9503]  ? kmemdup_noprof+0x55/0x70
[   43.882295][ T9503]  ? __asan_memcpy+0x40/0x70
[   43.882787][ T9503]  v_rx_loop+0x84d/0xd90
[   43.883238][ T9503]  ? __pfx_v_rx_loop+0x10/0x10
[   43.883771][ T9503]  ? __kthread_parkme+0x7a/0x200
[   43.884292][ T9503]  kthread+0x38b/0x480
[   43.884733][ T9503]  ? __pfx_v_rx_loop+0x10/0x10
[   43.885223][ T9503]  ? __pfx_kthread+0x10/0x10
[   43.885711][ T9503]  ret_from_fork+0x514/0xb70
[   43.886199][ T9503]  ? __pfx_ret_from_fork+0x10/0x10
[   43.886731][ T9503]  ? __switch_to+0xc79/0x1410
[   43.887198][ T9503]  ? __pfx_kthread+0x10/0x10
[   43.887661][ T9503]  ret_from_fork_asm+0x1a/0x30
[   43.888142][ T9503]  </TASK>
[   43.888447][ T9503] Modules linked in:
[   43.888884][ T9503] ---[ end trace 0000000000000000 ]---
[   43.889649][ T9503] RIP: 0010:__dev_printk+0x6e/0x190
[   43.889659][ T9503] Code: 00 fc ff df 49 ff c7 4c 89 f8 48 c1 e8 03
42 0f b6 04 28 84 c0 0f 85 16 01 00 00 41 0f b6 2f 4d 8d 7e 68 4c 89
f8 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 ff e8 63 c7 1b fc 4d 8b 3f
4d 85 ff 75
[   43.889665][ T9503] RSP: 0018:ffffc90007987aa8 EFLAGS: 00010202
[   43.889672][ T9503] RAX: 0000000000000023 RBX: ffffc90007987b40
RCX: 000000008c764501
[   43.889677][ T9503] RDX: 0000000000000000 RSI: 00000000000000b0
RDI: ffffffff8c764560
[   43.889682][ T9503] RBP: 0000000000000033 R08: ffffc90007987b77
R09: 0000000000000000
[   43.889687][ T9503] R10: ffffc90007987b60 R11: fffff52000f30f6f
R12: ffffc90007987b20
[   43.889692][ T9503] R13: dffffc0000000000 R14: 00000000000000b0
R15: 0000000000000118
[   43.889697][ T9503] FS:  0000000000000000(0000)
GS:ffff8880d7388000(0000) knlGS:0000000000000000
[   43.889703][ T9503] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   43.889708][ T9503] CR2: 000055f3e6a0e240 CR3: 000000010f232000
CR4: 0000000000752ef0
[   43.889715][ T9503] PKRU: 55555554
[   43.889721][ T9503] Kernel panic - not syncing: Fatal exception
[   43.900522][ T9503] Kernel Offset: disabled
[   43.901129][ T9503] Rebooting in 86400 seconds..

Regards,

--000000000000961557065b38cc00
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtx9bsp50>
X-Attachment-Id: f_mtx9bsp50

LyoKICogMjczLWdlbmVyYWwtcHJvdGVjdGlvbi1mYXVsdC1pbi11c2JpcC1yZWN2LXhidWZmCiAq
LwojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8c3RyaW5n
Lmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KI2luY2x1ZGUgPGZjbnRsLmg+CiNpbmNsdWRlIDxlcnJu
by5oPgojaW5jbHVkZSA8c3RkaW50Lmg+CiNpbmNsdWRlIDxzeXMvc3RhdC5oPgojaW5jbHVkZSA8
c3lzL21vdW50Lmg+CiNpbmNsdWRlIDxzeXMvc29ja2V0Lmg+CiNpbmNsdWRlIDxhcnBhL2luZXQu
aD4KCiNkZWZpbmUgR0FER0VUX0NPTkZJR0ZTX0RJUiAiL3N5cy9rZXJuZWwvY29uZmlnL3VzYl9n
YWRnZXQvZzEiCgojZGVmaW5lIFZVRENfREVWSUNFX05BTUUgInVzYmlwLXZ1ZGMuMCIKCnN0YXRp
YyB2b2lkIHdyaXRlX3N5c2ZzX2F0dHJpYnV0ZShjb25zdCBjaGFyICpwYXRoLCBjb25zdCBjaGFy
ICp2YWx1ZSkKewoJaW50IGF0dHJpYnV0ZV9mZCA9IG9wZW4ocGF0aCwgT19XUk9OTFkpOwoKCWlm
IChhdHRyaWJ1dGVfZmQgPCAwIHx8IHdyaXRlKGF0dHJpYnV0ZV9mZCwgdmFsdWUsIHN0cmxlbih2
YWx1ZSkpIDwgMCkgewoJCWZwcmludGYoc3RkZXJyLCAid3JpdGUgJXMgPC0gJXM6ICVzXG4iLCBw
YXRoLCB2YWx1ZSwgc3RyZXJyb3IoZXJybm8pKTsKCQlleGl0KDEpOwoJfQoJY2xvc2UoYXR0cmli
dXRlX2ZkKTsKfQoKc3RhdGljIHZvaWQgbWFrZV9jb25maWdmc19kaXIoY29uc3QgY2hhciAqcGF0
aCkKewoJaWYgKG1rZGlyKHBhdGgsIDA3NzcpICYmIGVycm5vICE9IEVFWElTVCkgewoJCWZwcmlu
dGYoc3RkZXJyLCAibWtkaXIgJXM6ICVzXG4iLCBwYXRoLCBzdHJlcnJvcihlcnJubykpOwoJCWV4
aXQoMSk7Cgl9Cn0KCnN0cnVjdCB1c2JpcF9jbWRfc3VibWl0X3BkdSB7Cgl1aW50MzJfdCBjb21t
YW5kLCBzZXFudW0sIGRldmlkLCBkaXJlY3Rpb24sIGVuZHBvaW50OwoJdWludDMyX3QgdHJhbnNm
ZXJfZmxhZ3M7CglpbnQzMl90ICB0cmFuc2Zlcl9idWZmZXJfbGVuZ3RoOwoJaW50MzJfdCAgc3Rh
cnRfZnJhbWU7CglpbnQzMl90ICBudW1iZXJfb2ZfcGFja2V0czsKCWludDMyX3QgIGludGVydmFs
OwoJdW5zaWduZWQgY2hhciBzZXR1cFs4XTsKfSBfX2F0dHJpYnV0ZV9fKChwYWNrZWQpKTsKCmlu
dCBtYWluKHZvaWQpCnsKCXN0cnVjdCB1c2JpcF9jbWRfc3VibWl0X3BkdSBjbWRfc3VibWl0X3Bk
dTsKCWludCB1c2JpcF9zb2NrZXRfcGFpclsyXTsKCWNoYXIgc29ja2ZkX2F0dHJpYnV0ZV9wYXRo
WzI1Nl07CgljaGFyIHNvY2tmZF9hc190ZXh0WzMyXTsKCglta2RpcigiL3N5cy9rZXJuZWwvY29u
ZmlnIiwgMDc3Nyk7Cgltb3VudCgiY29uZmlnZnMiLCAiL3N5cy9rZXJuZWwvY29uZmlnIiwgImNv
bmZpZ2ZzIiwgMCwgTlVMTCk7CgoJbWFrZV9jb25maWdmc19kaXIoIi9zeXMva2VybmVsL2NvbmZp
Zy91c2JfZ2FkZ2V0Iik7CgltYWtlX2NvbmZpZ2ZzX2RpcihHQURHRVRfQ09ORklHRlNfRElSKTsK
CW1ha2VfY29uZmlnZnNfZGlyKEdBREdFVF9DT05GSUdGU19ESVIgIi9jb25maWdzL2MuMSIpOwoJ
bWFrZV9jb25maWdmc19kaXIoR0FER0VUX0NPTkZJR0ZTX0RJUiAiL2Z1bmN0aW9ucy9hY20uMCIp
OwoJaWYgKHN5bWxpbmsoR0FER0VUX0NPTkZJR0ZTX0RJUiAiL2Z1bmN0aW9ucy9hY20uMCIsCgkJ
ICAgIEdBREdFVF9DT05GSUdGU19ESVIgIi9jb25maWdzL2MuMS9hY20uMCIpICYmIGVycm5vICE9
IEVFWElTVCkgewoJCXBlcnJvcigic3ltbGluayBhY20uMCBpbnRvIGMuMSIpOwoJCXJldHVybiAx
OwoJfQoKCXdyaXRlX3N5c2ZzX2F0dHJpYnV0ZShHQURHRVRfQ09ORklHRlNfRElSICIvVURDIiwg
VlVEQ19ERVZJQ0VfTkFNRSk7CgoJaWYgKHNvY2tldHBhaXIoQUZfVU5JWCwgU09DS19TVFJFQU0s
IDAsIHVzYmlwX3NvY2tldF9wYWlyKSkgewoJCXBlcnJvcigic29ja2V0cGFpciIpOwoJCXJldHVy
biAxOwoJfQoJc25wcmludGYoc29ja2ZkX2F0dHJpYnV0ZV9wYXRoLCBzaXplb2Yoc29ja2ZkX2F0
dHJpYnV0ZV9wYXRoKSwKCQkgIi9zeXMvZGV2aWNlcy9wbGF0Zm9ybS8lcy91c2JpcF9zb2NrZmQi
LCBWVURDX0RFVklDRV9OQU1FKTsKCXNucHJpbnRmKHNvY2tmZF9hc190ZXh0LCBzaXplb2Yoc29j
a2ZkX2FzX3RleHQpLCAiJWQiLCB1c2JpcF9zb2NrZXRfcGFpclswXSk7Cgl3cml0ZV9zeXNmc19h
dHRyaWJ1dGUoc29ja2ZkX2F0dHJpYnV0ZV9wYXRoLCBzb2NrZmRfYXNfdGV4dCk7CgoJbWVtc2V0
KCZjbWRfc3VibWl0X3BkdSwgMCwgc2l6ZW9mKGNtZF9zdWJtaXRfcGR1KSk7CgljbWRfc3VibWl0
X3BkdS5jb21tYW5kID0gaHRvbmwoMSk7CgljbWRfc3VibWl0X3BkdS50cmFuc2Zlcl9idWZmZXJf
bGVuZ3RoID0gaHRvbmwoNDA5Nik7CgoJaWYgKHdyaXRlKHVzYmlwX3NvY2tldF9wYWlyWzFdLCAm
Y21kX3N1Ym1pdF9wZHUsIHNpemVvZihjbWRfc3VibWl0X3BkdSkpCgkgICAgIT0gKHNzaXplX3Qp
c2l6ZW9mKGNtZF9zdWJtaXRfcGR1KSkgewoJCXBlcnJvcigid3JpdGUgQ01EX1NVQk1JVCBwZHUi
KTsKCQlyZXR1cm4gMTsKCX0KCglzaHV0ZG93bih1c2JpcF9zb2NrZXRfcGFpclsxXSwgU0hVVF9X
Uik7CgoJc2xlZXAoNSk7CglyZXR1cm4gMDsKfQo=
--000000000000961557065b38cc00--
