Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.235
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647146;
	b=FAef77c6/urP8Wubl9j1SInpUG9VOT6ZbY1U/5Z+AwBgCarYqJjTwbN0ts4zIFmqJm1y
	 K7AZwC7oSZ+OkdFRSLlQMKRW7HAphR/oxCeVaoSjeeuXpC86sllz+jxxxetd0JJTsQDJF
	 xhHlL0p3bUQuz0jsywH/BurVVvO7jdEZcbpPvZkpFG1mQn/HwN0cfdiQ+IIaxOwq5feSv
	 Ru1oXht51mXp9OdRu1Nf00blZHXYFD/DCzah++c4LfeFzZJiEAELxYWNns92l/2oNREht
	 Ylt+ktgx1VZDu3izmVqGW0oLcg1XgJGjfYdO3ubxfU0TZYfDZitfL5HBlbtfcM2Lsng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647146;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=QG3mWmjrN8rAn4/IOLUa3y/4n+sw7b9lbBvkp5qN+9k=;
	b=QvTTNMm7bvt6njZrrMySGKgansu6aR6MWc9sOeUuilVRkffN5H7ZcPpoXaz0PLcQnRSq
	 YnsTPxkq1KZczq+F+DHhQ41ZmhcttBMe0zsorye9j2MBi24qHwUuD5g4VipIemGBgrW60
	 dcyZCGzNJzJ0TDL8piCefe6xzewmGFfcaROCog9ctwRnNYbYenlMpMBemCgey0mb1k8TK
	 SsMLwbtlJ72UBQJ3Ad/QZeREIAHqF4Vq38DGDq+EVGfR0i/a/GhjtFvHQG8OwYLufbZfF
	 DYnRo78MwX7N+pxzwR8YY3CdqEqUf6eoBeqUZEkVIaH95rYYWozIrmzayoaPAMBqxQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fGY+Rp0B;
	arc=none smtp.remote-ip=203.205.221.235
Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com [203.205.221.235])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F3A606A32D;
	Sat, 14 Nov 2026 09:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F3A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fGY+Rp0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794647140; bh=QG3mWmjrN8rAn4/IOLUa3y/4n+sw7b9lbBvkp5qN+9k=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=fGY+Rp0BoTt3HYoV3Gz2zMpDiUTT+0l3+NnIWPPYZfEX8EpylHYxBqFx7/kZJjZLr
	 kYdOYcC/Yc/VJuppu4tDWUv1n5onqr+JdHMvM5+ogg6q5itkcVnT2kTmZG6M7cymOc
	 phEE7MHCqvYYJTxDI2jrlzbLIUpOY3eEaurfzHnY=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-XMAILINFO: OeJOoYd4plGb3pMLvCEyeh/jS/gvnUYkXiZ2IC/jG89TWN25zXMx8W8wuaUFLc
	 I17bCPiW9HFWv9zrYWti6Vr3UFJMqXrpmQbFDuQYe1gSrt/PapYNlZ1001ybcStHT2v6t7ekzVS9p
	 9wawtkskQ+fivekOVaLB1vUA390ToaGdy/WuZAjxsIF4bmpVoOuaQ74l4MeQRHER1g4FB1C22vVQ3
	 7ZQeyhL01dseKQFmBj3gi525pum4rFHt/yZsej+ljq04VPhN7tJXXt6VVWEZgdg72e59WV204ejhT
	 vsQjihYueSzD6dcDdmTCY/lpeK1iGKgihKVVpxYnQ5Tf5ThJ1W45rEKJeuKJlbGCbDz/sHc9RSOLe
	 uNJ26yYtOGhKf4qYsZeuPuNHrtKZeUBYjCIZLbTY2piEmiAZp4vOB9cR8GL7Ll+v+KcJ7sXBGY9Xc
	 iU6MTr89swuuiE4qFqK/Wky7fAjE7dp0s3jwmn/x4XivyQByWbO0s+4YvwkK57EahrbJfG+VjWtDJ
	 LHgBGpU9WdYOEzPzKl0i3ULh963/uMzdnycKYGXV3XeJ4SlsEeQHYqCKtkUii3mS3demyfz4++f/a
	 xdq4+6E5V/uQt7O2RfS0yViVWWUxXlm8nw0d1fL+O51iTh6IFg+zYDdsl0y5FXkM/FPaK8ViKejaw
	 6cVxQh6LxDZpzOERtikv/dh1QDJacqEQK7tcY3JocJWvrtsTPULJKqvv3fDt+VZb7BxugSxNBB/FO
	 UmmyDwVV6Rbz/PIiHd9teAWItqhB7wwuqGgXC7EjMDZpTPTfXUNTAkXM5+6t0oPVIsuBa4RWoGPB2
	 73XgCpFh7br+5CKgi7T5PDg+VLbyhmCOLEMAgdQPBSNnIByziBlLEUNkd33fXloK5UunBEi0x/gby
	 HQuTQwyHe5NEr1Zzv3o3Q9iw8+car3EReByt3Cf9j7HCBRucUX9WIMjkemgpUDfiW7kZUs9F+bsYO
	 k1VtrBdJapoLTN6chiVBRIHxeep1lDOE33YtzEiGWtLfEuHbEYKArNJ3f0VQXy1UB2xShOQf5axu7
	 OdAxL704N5ppmu3x6HjXHLVJh6uftPyXexNqBJ/JQHmMCwbQLC35VcZwhmDtdcCpSRlEFvoRi6Rvt
	 xNQ=
From: "=?utf-8?B?6Zey6YCb?=" <2368492046@qq.com>
To: "=?utf-8?B?V2VpamllIFl1YW4=?=" <wy@wyuan.org>
Cc: "=?utf-8?B?Y29yYmV0?=" <corbet@lwn.net>, "=?utf-8?B?bWNoZWhhYg==?=" <mchehab@kernel.org>, "=?utf-8?B?bGludXgtZG9j?=" <linux-doc@vger.kernel.org>, "=?utf-8?B?c2toYW4=?=" <skhan@linuxfoundation.org>, "=?utf-8?B?cmR1bmxhcA==?=" <rdunlap@infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/4] docs: kernel-doc: fix export selection and error handling
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sat, 14 Nov 2026 17:05:38 +0800
X-Priority: 3
Message-ID: <tencent_79B4A967C5ADFFCE3CCF0EA9362419ABE105@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_9BF64A4FFFB7B990DD5E6D6CF26C43565306@qq.com>
	<avgDq_FrLSbuC7bK@wyuan.org>
In-Reply-To: <avgDq_FrLSbuC7bK@wyuan.org>
X-QQ-mid: xmsezc52-0t1794647138tnblksva0

SGkgV2VpamllLAoKVGhhbmsgeW91IGZvciByZXZpZXdpbmcgbXkgc3VibWlzc2lvbiwgYW5k
IHNvcnJ5IGZvciB0aGUgbWlzdGFrZXMuCkFsdGhvdWdoIEkgaGF2ZSBiZWVuIGZhbWlsaWFy
IHdpdGggYW5kIHVzaW5nIExpbnV4IGZvciBuZWFybHkgdGVuCnllYXJzLCB0aGlzIGlzIG15
IGZpcnN0IHRpbWUgc3VibWl0dGluZyBhIGJ1ZyBmaXggdG8gdGhlIGtlcm5lbApjb21tdW5p
dHksIGFuZCBJIHN0aWxsIGhhdmUgYSBsb3QgdG8gbGVhcm4gYWJvdXQgdGhlIHByb2Nlc3Mu
CgpUaGlzIHYyIHNlcmllcyBmaXhlcyBmb3VyIGtlcm5lbC1kb2MgaXNzdWVzOgoKICAxLiBQ
YXNzIHRoZSByZXF1aXJlZCB0cmFuc2Zvcm1zIHdoZW4gcGFyc2luZyBzZXBhcmF0ZSBleHBv
cnQgZmlsZXMuCiAgMi4gQ29tYmluZSBpbnB1dCBhbmQgYWRkaXRpb25hbCBleHBvcnQgc291
cmNlcyBjb3JyZWN0bHkuCiAgMy4gSG9ub3IgZW52aXJvbm1lbnQgd2FybmluZy1hcy1lcnJv
ciBzZXR0aW5ncyBpbiB0aGUgZXhpdCBzdGF0dXMuCiAgNC4gSW1wb3J0IHN5cyBmb3IgWUFN
TCBmYWlsdXJlIGRpYWdub3N0aWNzLgoKSSBzdG9wcGVkIGFmdGVyIHRoZSByZWdyZXNzaW9u
IHRlc3RzLCB3aGljaCB3YXMgaW5zdWZmaWNpZW50CnZhbGlkYXRpb24uIEkgc2hvdWxkIGhh
dmUgY29tcGxldGVkIHRoZSBkb2N1bWVudGF0aW9uIGJ1aWxkIGJlZm9yZQpzZW5kaW5nIHYx
LgoKRnVsbCBkb2N1bWVudGF0aW9uIGJ1aWxkcyBoYXZlIG5vdyBjb21wbGV0ZWQgb24gYm90
aCB0aGUgdW5tb2RpZmllZApkb2NzLW5leHQgYmFzZSBhbmQgdGhlIHJldmlzZWQgc2VyaWVz
LCB1c2luZyBVYnVudHUgMjQuMDQgdW5kZXIgV1NMMgp3aXRoIFB5dGhvbiAzLjEyLjMgYW5k
IFNwaGlueCA3LjIuNjoKCiAgbWFrZSAtajQgTz0uLi9iYXNlbGluZS1sZi1idWlsZCBodG1s
ZG9jcyBTUEhJTlhPUFRTPSctajQnCiAgbWFrZSAtajQgTz0uLi9wYXRjaGVkLWJ1aWxkIGh0
bWxkb2NzIFNQSElOWE9QVFM9Jy1qNCcKCkJvdGggY29tbWFuZHMgcmV0dXJuZWQgZXhpdCBz
dGF0dXMgMCBhbmQgZ2VuZXJhdGVkIDQsMTM4IEhUTUwgcGFnZXMuCkJvdGggbG9ncyBjb250
YWluIHRoZSBzYW1lIDkyIGRpYWdub3N0aWMgbGluZXMgYWZ0ZXIgbm9ybWFsaXppbmcKc291
cmNlIGFuZCBvdXRwdXQgcGF0aHM7IHRoZSByZXZpc2VkIHNlcmllcyBhZGRzIG5vIG5ldyBk
aWFnbm9zdGljcy4KClRoZSBmYWlsdXJlIHdhcyBzcGVjaWZpYyB0byBteSBIVFRQUyBhdHRl
bXB0LiBGZXRjaGluZyB0aHJvdWdoCmdpdDovL2dpdC5sd24ubmV0L2xpbnV4LmdpdCwgYXMg
bGlzdGVkIGluIE1BSU5UQUlORVJTLCB3b3JrZWQuCk15IGVhcmxpZXIgZXhwbGFuYXRpb24g
d2FzIGluY29tcGxldGUuCgpUaGUgcmV2aXNlZCBzZXJpZXMgaXMgbm93IGJhc2VkIG9uIGRv
Y3MtbmV4dCBjb21taXQ6CjIxMzgxNDhiZjQ0ZmQ4NGQzZTBhODYzZjBlOGNiMzYyN2NkY2M2
MDYKClRoZSBmb2xsb3ctdXAgcmV2aWV3IGFsc28gaWRlbnRpZmllZCBtaXNzaW5nIGNvdmVy
YWdlIGZvciBjb21iaW5pbmcKaW5wdXQgYW5kIGFkZGl0aW9uYWwgZXhwb3J0IGZpbGVzLCBh
bmQgZm9yIHJlbGF0aXZlIFNSQ1RSRUUgcGF0aHMuClRoZXNlIGNhc2VzIGFyZSBub3cgZml4
ZWQgYW5kIGNvdmVyZWQgYnkgcmVncmVzc2lvbiB0ZXN0cy4gVGhlIGZ1bGwKc3VpdGUgb24g
dGhlIHJldmlzZWQgZG9jcy1uZXh0IHRyZWUgcnVucyAxMzcgdGVzdHM6IDEzMyBwYXNzLCB3
aXRoCmZvdXIgcHJlLWV4aXN0aW5nIGV4cGVjdGVkIGZhaWx1cmVzLgoKSSBoYXZlIGFsc28g
cmVhZCB0aGUgc3VibWlzc2lvbiBpbnN0cnVjdGlvbnMgeW91IGxpbmtlZC4gSSB3aWxsIHNl
bmQKdjIgYXMgc2VwYXJhdGUgaW5saW5lIHBsYWluLXRleHQgcGF0Y2ggZW1haWxzLCB3aXRo
b3V0IGF0dGFjaG1lbnRzLgoKVGhhbmsgeW91IGZvciB5b3VyIHRpbWUgYW5kIGd1aWRhbmNl
LgoKQmVzdCByZWdhcmRzLAp5dWVodWEtbWVuZw==

