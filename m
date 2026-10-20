Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792520336;
	b=jtV3vXheFg/TV8FDz8g8MKaWDRYMsAazHq5lh1SWaGAPr0OXhVW7wteYwSuR2Tirjp+8
	 y5okedYIYThIN+Mu0dbndr1ei5GbtfXEVxujdgHprHncxek3ONmSvYYvUVCgI1flHXSpr
	 6QLX6F1bgDesIYVY7MYkCtRkzf6Gxs8vsnjK4e9wJc8F0SRj6A0Ig9tkBWXW3p8Xr3IKj
	 7v0dQOYuGpPFIiTWtwVNCuyYmymAW2+ZZffQiuIdg+8dbh/cFfdwTO7DV2NAvvBD424ho
	 6o1Kuw69/VcfYHHiwGQEqgB1sZyzsK1SoCzgRr8ypMrqeJ9GvvRQJ+g2ocrV7L6WK3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=XuyCTZj8gPZvUl1CHHVB79Z4Me8T8O5ovdkbzwvs2Vg=;
	b=oWWAK5/pjQXDNlIxhlpx8v0Q6X+m7Maowc//hsanWxrqQaX5v9nqum2GEn5UhetmmcZt
	 jINxtVmI7lqqjmsgEX2tyXzC+vM+res3X1vINrzF9ft+FWKb4dC8IBb0cjafeSm5hZv+/
	 v9Zzp2h1MD53QzkzuezYk/q1VJFuNFkp4LgKGjXfjqnKa2lIE6Jpfm6CcS8ztsFeJrLqD
	 /bhUO09KMD8/WByiVpEhFtR/wMSuf4+uStKTiBUyywq4KGmxZq+eJphB0A6WPRnNpv56w
	 Lu40//mhorcMGJ+8kAA+WCPgGrR6zoNKWaBmVMBUW66YtdmIzcO3qQN6O4gEES8Ky3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OTu6uhXn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82141606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82141606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OTu6uhXn
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-675676afc3cso3594383d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792520335; cv=none;
        d=google.com; s=arc-20260327;
        b=hv4I/9yhw0QA1HBa2B0X4BsczVTpQw7d/Jp++XLDMMgID2Yrs1P2rcJh3yCNnjmpLc
         7HPLYyMnOWuJyrND43mVsqNKFSa6hL2YhbpF62zHsL07iBs1B+BNowbjjqXmWOpgGN9R
         xUy6Rjq31/Bi4JmKr8ID4/6r198EOKv4B//yI9lwFHblmDhXYfSRZ5wnQKna0+e/e4Xa
         xNADbG7whzLnRQVRacLlDZ792NI7cCb6khSRkt+psX/sXvISZGl+8D8YqOynjLcFHVWi
         BZldd0NdF3P/BkHC8nxUuXWuNwK2HCZaVXTQYZCq5Ls0VBY825fp+k7hhP3iVRsP+KUR
         qfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=XuyCTZj8gPZvUl1CHHVB79Z4Me8T8O5ovdkbzwvs2Vg=;
        fh=P21mtte96B/mT9So3Ko+z8fGkX56YGLnrtIX+PTSrmw=;
        b=Jlf+VjMRqD6195QRK3HZMv89iV+yHrGysPZ7Rst/8kK49UkhjtYwoKfpP8evt9HgmF
         +8f+zAnRTRWhBXgXXWaDHc0V/by0/+0O251VXGbVONDzijWz3I4jqDRO8wi5eTpx9z6L
         3fjkDSeJONNR80qRbyroyvED7EZ8ivDII9EsFjqIpnl1lIfDRUPf3lNNwhIY0l2Qd1Mt
         0m5yU4EWbJFHWXbcLIlfMi/kGbxTmE6VrEVJoqwwn+PM1fHXLFHhWsMPsQvKFhWhXiNx
         xe6vPE3Ia4ki1sFogpzuIO0oAfuRS2RHupC33kv5l8kWcQ9xoKg3Sv4sizrakJQ17au4
         Z/Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520335; x=1793125135; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XuyCTZj8gPZvUl1CHHVB79Z4Me8T8O5ovdkbzwvs2Vg=;
        b=OTu6uhXnh+BQTnfn3sxkL5bAQJgbfvT8enUh+mWmQjGmqQrpqB2rFNX/MCQ7M9bmoX
         sKyqxcIoQdlV1W+xZldyZjkmJvJMp3lD5tyhuamVdSW2OeGSTEK+rYyQPI/oNtKtTvy2
         oLoN1fwQ1GXjKFAXY8wnbRH7ZrlEqiN5TOyrHT8FQOGli9ypNAwJNN05R3z7guYdU90u
         NV4+D3Ru4SIx0YO//yQa6K+yG/HDwJy3TNUn19vphFi1OHQzWAMBMMENjl4M2gXM76Qh
         DjFyl873LfUX2ay+vLHmLBKyDJKa28V6pvGyJmW0LpubO3xFNR5C0WsC71r6lMbwQyXD
         8ZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520335; x=1793125135;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XuyCTZj8gPZvUl1CHHVB79Z4Me8T8O5ovdkbzwvs2Vg=;
        b=jC+sZYHNBfMk7N7S/zStAg5A/qjV7cqKxO6qfqkJ+NbF6yl3JvCVzyGnmxS/s1rQIN
         3Nw6emAie5PTbmuxnjO/33yCHVBHinONQx9b08Y3lnP4SSIVryUabU2sr6/uF9YTM3O/
         visnl3C/aDCQEZAJSrQTei6+OFbaUFV8RGsEbcNdQGRnlbMGnlmDAT2PH/Bc2ZZBq6Nr
         EWjuBz9jeyhAloOi+dnDR1Bxx9XLOn2e66JHeL92oBUWD4LpWqXPdhtakhvKq2EcJKrn
         DaipZ9NSr4rWIfqB1rlHBqizksVB4Ez0iaIBL01+UyapaqYQILa3VHhSSRDXDp3zZgZj
         fWTw==
X-Forwarded-Encrypted: i=1; AKwUvBw6CgoVkp/tulVm2wq7dHvxDyPXf7FSNhTkLnqI6uyIP/s317Ii7+0oMXtlVkkio4mkBXJ8ra+vDq+xZJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmroOOarG+FKFYlusByL692H4bgf6ZcNJb6mOT/ghHQrsOHbU7
	FC1UMQn0jcLBxsQd8KeFz/DFmFlqada45EheJcWNMivHX59GILkAPY8A6O+4xoIj5dDmV72E/SL
	RaUAjI5Q/L3S5Bgnjoueaxx26SheIohTw+Q==
X-Gm-Gg: AYBFou3b0+ttlZbv2K7DtGIoFxRA03c5niyjvKH+fldwMvjo3KoT6uf3p5JCaDTW55l
	XIaaMVTxFVE/knyR3HvabrrJVQ8EjX5A+QYleGi3EGViWhWz7Hs3VEIrGsw/k/QUZP2UmPTRfca
	qMAaSUYhBs01gTYRF3nBU0QqHoXQ13a3C6Uwa2eD6NBVSFw22uJ5ciUh7lh+qB149+2ZjdpVZDx
	3oEi0xQhIoxvWyT4ydrLPkOvxU2E1tsum7ffSD6PjTlp5sQBANdBzibhPhMoBubauV4vq0IB1gh
	xlRR67WZQapqG5eQpqQIm4Eh9mclp1oYilwh2xpxKt8RY5hvR8i0zBXqJovRyGopxsO27LNjgSm
	OlPLtLrpCj/lg
X-Received: by 2002:a05:690e:4092:b0:677:edc8:2d93 with SMTP id
 956f58d0204a3-67a0ddf67fbmr59373d50.0.1792520335449; Tue, 20 Oct 2026
 11:18:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Mohammed <mohammed.saad.alquraini@gmail.com>
Date: Tue, 20 Oct 2026 21:18:43 +0300
X-Gm-Features: AclHuK9-z3kWmIRRdVCBQCNai6XrCsdMNLXAZopo76rjfyChogdzOwx1tST6dQY
Message-ID: <CAD37_9gRtYiiKOV-efL7HAaP+_F7CUhv6k-iJhfwnEwuYt3GWg@mail.gmail.com>
Subject: [PATCH] ksmbd: reject foreign RPC pipe handles on IPC$ read and write
To: linkinjeon@kernel.org
Cc: linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000d93cc1065e49a9d2"

--000000000000d93cc1065e49a9d2
Content-Type: text/plain; charset="UTF-8"

Hi Namjae,

Patch attached for the IPC$ pipe-handle issue I reported. Tested
locally. Thanks!

Best regards,
Mohammed Alquraini

--000000000000d93cc1065e49a9d2
Content-Type: application/x-patch; 
	name="0001-ksmbd-reject-foreign-RPC-pipe-handles-on-IPC-read-an.patch"
Content-Disposition: attachment; 
	filename="0001-ksmbd-reject-foreign-RPC-pipe-handles-on-IPC-read-an.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvh096141>
X-Attachment-Id: f_mvh096141

RnJvbSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNb2hhbW1lZCBBbHF1cmFpbmkgPG1vaGFtbWVkLnNhYWQuYWxx
dXJhaW5pQGdtYWlsLmNvbT4KRGF0ZTogTW9uLCAyMCBPY3QgMjAyNiAyMDozMDowMCArMDMwMApT
dWJqZWN0OiBbUEFUQ0hdIGtzbWJkOiByZWplY3QgZm9yZWlnbiBSUEMgcGlwZSBoYW5kbGVzIG9u
IElQQyQgcmVhZCBhbmQgd3JpdGUKClJQQyBwaXBlIGhhbmRsZXMgb24gSVBDJCBhcmUgYWxsb2Nh
dGVkIGZyb20gYSBzaW5nbGUgc2VydmVyLWdsb2JhbCBJREEsCmFuZCBrc21iZC5tb3VudGQgbG9v
a3MgYSBwaXBlIHVwIGJ5IGhhbmRsZSBhbG9uZSwgd2l0aCBubyBzZXNzaW9uCmluZm9ybWF0aW9u
LiAgc21iMl9yZWFkX3BpcGUoKSBhbmQgc21iMl93cml0ZV9waXBlKCkgdGFrZSB0aGUgaGFuZGxl
CnN0cmFpZ2h0IGZyb20gdGhlIGNsaWVudCByZXF1ZXN0IChWb2xhdGlsZUZpbGVJZCkgYW5kIHBh
c3MgaXQgdG8gdGhlCmRhZW1vbiB3aXRob3V0IGNoZWNraW5nIHRoYXQgdGhlIHJlcXVlc3Rpbmcg
c2Vzc2lvbiBvcGVuZWQgaXQuICBBbgphdXRoZW50aWNhdGVkIHVzZXIgY2FuIHRoZXJlZm9yZSBp
c3N1ZSBhbiBTTUIyIFJFQUQgb3IgV1JJVEUgb24gSVBDJAp3aXRoIGFub3RoZXIgc2Vzc2lvbidz
IGhhbmRsZSBhbmQgcmVjZWl2ZSB0aGF0IHNlc3Npb24ncyBpbi1mbGlnaHQKRENFUlBDIHJlc3Bv
bnNlLCBvciB3cml0ZSBhdHRhY2tlci1jaG9zZW4gYnl0ZXMgaW50byBpdHMgcGlwZSBzdHJlYW0u
CkEgdHJlZSBjb25uZWN0IHRvIElQQyQsIHdoaWNoIGV2ZXJ5IFJQQyBjbGllbnQgYWxyZWFkeSBo
YXMsIGlzIHRoZSBvbmx5CnJlcXVpcmVtZW50LgoKVmFsaWRhdGUgb3duZXJzaGlwIGJlZm9yZSB0
aGUgdHJhbnNmZXIsIHRoZSB3YXkgdGhlIHNpYmxpbmcgcGlwZSBwYXRocwphbHJlYWR5IGRvOiB1
bmRlciBzZXNzLT5ycGNfbG9jaywga3NtYmRfc2Vzc2lvbl9ycGNfbWV0aG9kKCkgcmV0dXJucyAw
CmZvciBhIGhhbmRsZSB0aGUgc2Vzc2lvbiBkaWQgbm90IG9wZW4uICBzbWIyX2dldF9pbmZvX2Zp
bGVfcGlwZSgpIGFuZAp0aGUgRlNDVExfUElQRV9UUkFOU0NFSVZFIGlvY3RsIGFscmVhZHkgcmVq
ZWN0IHN1Y2ggaGFuZGxlczsgcmVhZCBhbmQKd3JpdGUgd2VyZSB0aGUgcmVtYWluaW5nIGdhcC4g
IFJlamVjdCB0aGVtIHdpdGggU1RBVFVTX0ZJTEVfQ0xPU0VELCBhcwp0aGUgaW9jdGwgcGF0aCBk
b2VzLgoKRml4ZXM6IGUyZjM0NDgxYjI0ZCAoImNpZnNkOiBhZGQgc2VydmVyLXNpZGUgcHJvY2Vk
dXJlcyBmb3IgU01CMyIpCkFzc2lzdGVkLWJ5OiBMTE0KU2lnbmVkLW9mZi1ieTogTW9oYW1tZWQg
QWxxdXJhaW5pIDxtb2hhbW1lZC5zYWFkLmFscXVyYWluaUBnbWFpbC5jb20+Ci0tLQogZnMvc21i
L3NlcnZlci9zbWIycGR1LmMgfCAyMCArKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDIwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9mcy9zbWIvc2VydmVyL3NtYjJwZHUu
YyBiL2ZzL3NtYi9zZXJ2ZXIvc21iMnBkdS5jCmluZGV4IDQwYWYzNWMwYS4uNWNkYTM0M2UxIDEw
MDY0NAotLS0gYS9mcy9zbWIvc2VydmVyL3NtYjJwZHUuYworKysgYi9mcy9zbWIvc2VydmVyL3Nt
YjJwZHUuYwpAQCAtOTIzMyw2ICs5MjMzLDE2IEBAIHN0YXRpYyBub2lubGluZSBpbnQgc21iMl9y
ZWFkX3BpcGUoc3RydWN0IGtzbWJkX3dvcmsgKndvcmspCiAKIAlpZCA9IHJlcS0+Vm9sYXRpbGVG
aWxlSWQ7CiAKKwlsb2NrZGVwX2Fzc2VydF9ub3RfaGVsZCgmd29yay0+c2Vzcy0+cnBjX2xvY2sp
OworCWRvd25fcmVhZCgmd29yay0+c2Vzcy0+cnBjX2xvY2spOworCWlmICgha3NtYmRfc2Vzc2lv
bl9ycGNfbWV0aG9kKHdvcmstPnNlc3MsIGlkKSkgeworCQl1cF9yZWFkKCZ3b3JrLT5zZXNzLT5y
cGNfbG9jayk7CisJCXJzcC0+aGRyLlN0YXR1cyA9IFNUQVRVU19GSUxFX0NMT1NFRDsKKwkJc21i
Ml9zZXRfZXJyX3JzcCh3b3JrKTsKKwkJcmV0dXJuIC1FTk9FTlQ7CisJfQorCXVwX3JlYWQoJndv
cmstPnNlc3MtPnJwY19sb2NrKTsKKwogCXJwY19yZXNwID0ga3NtYmRfcnBjX3JlYWQod29yay0+
c2VzcywgaWQpOwogCWlmIChycGNfcmVzcCkgewogCQl2b2lkICphdXhfcGF5bG9hZF9idWY7CkBA
IC05ODYzLDYgKzk4NzMsMTYgQEAgc3RhdGljIG5vaW5saW5lIGludCBzbWIyX3dyaXRlX3BpcGUo
c3RydWN0IGtzbWJkX3dvcmsgKndvcmspCiAJCWdvdG8gb3V0OwogCX0KIAorCWxvY2tkZXBfYXNz
ZXJ0X25vdF9oZWxkKCZ3b3JrLT5zZXNzLT5ycGNfbG9jayk7CisJZG93bl9yZWFkKCZ3b3JrLT5z
ZXNzLT5ycGNfbG9jayk7CisJaWYgKCFrc21iZF9zZXNzaW9uX3JwY19tZXRob2Qod29yay0+c2Vz
cywgaWQpKSB7CisJCXVwX3JlYWQoJndvcmstPnNlc3MtPnJwY19sb2NrKTsKKwkJcnNwLT5oZHIu
U3RhdHVzID0gU1RBVFVTX0ZJTEVfQ0xPU0VEOworCQlzbWIyX3NldF9lcnJfcnNwKHdvcmspOwor
CQlyZXR1cm4gLUVOT0VOVDsKKwl9CisJdXBfcmVhZCgmd29yay0+c2Vzcy0+cnBjX2xvY2spOwor
CiAJZGF0YV9idWYgPSAoY2hhciAqKSgoKGNoYXIgKikmcmVxLT5oZHIuUHJvdG9jb2xJZCkgKwog
CQkJICAgZGF0YV9vZmZzZXQpOwogCi0tIAoyLjQzLjAK
--000000000000d93cc1065e49a9d2--
