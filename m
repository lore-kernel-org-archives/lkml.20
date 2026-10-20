Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480771;
	b=g/BZECkthd3cPr3eGSq5SRJZ7d65AvxrFBbenGRlqxnIcOH6hkfcfzzjeuk5u1563fnr
	 +Iv5p5REAuPONA4QoTBzZuuryYsHCSMb1pSPIrqsWDD4uFTmnyRtpUQ0cHpZqdYvL5nJN
	 GirzBdZZHt4NlaWpCt4sDqRXsChI4aUFVlV1wIPQP5Ddve2Rph1hVUdZh/rPPt2SRVayC
	 xQ3Arj1OrJLW5Hl5g4cr+gUuuFHhTOmHEb1S8HHTaKIIzD+LtSwDzoPNFgXc0GY0Vv4Fu
	 UVm7HHDmVdh+2M5wt2jP3gABr5ViARKcdmcTAsoJaOQbUsXyyN2Qx7zads8eoEPLc6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480771;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 In-Reply-To:References;
	bh=PsfWOHp9A/Q3awJ3zTQySiGskPz3jrS90MXWtnyloWc=;
	b=HPlDCHAUs0REFBxROCp3dH5QtgOEJ2llydEdjFrs213RwMO7OIf4Ghg8rgcPNho+VoyP
	 Kuy3fIKYq1KbUVzMrhWyU0t6An3sZ3hmo9StP8EFk5p46Bk9ofiSD7WP02k4fGMF5qokw
	 CqfEDEFc9d4DFVuEyn/ZEbOS+iSMuGVdqT1jJybl47Hh0V6witv7kKCpM/fkf6pdFPE4M
	 /ATlFPZs9LKZwNMXZz47aKtA191Q1ys9ua9HLLPSIiZXyZyKNdcJM08BwjohC3thDSvno
	 kDJQ/E37apGOcpSFgC++7l9rKxnvQzjW0INPz+3q50EmDRLjkv62htknSta7ZLiTchw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=IMkCvQsC;
	arc=none smtp.remote-ip=162.62.57.252
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FF0606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82FF0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=IMkCvQsC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792480765; bh=PsfWOHp9A/Q3awJ3zTQySiGskPz3jrS90MXWtnyloWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IMkCvQsCX6ED2iOngL558vthtDCdwLeiIlExLS0U4mqEbWlLB8RJLZdLCspn0pISh
	 Uy4eLFE/4TwE/mz5VfwycyXgXiHpWsTssRJr9kbUbOY7Vg1pd9G1O3+nzPfNvdMFKr
	 gmOnVCO+8i7GhOfCTqtCAQP+qycegbeZVRKEdTo4=
Received: from [127.0.0.1] ([223.104.162.184])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 4D4A8218; Tue, 20 Oct 2026 15:19:20 +0800
X-QQ-mid: xmsmtpt1792480760t4xnu6p3b
Message-ID: <tencent_56AB3AF14CC0D56366D5E66461ECDF324A05@qq.com>
X-QQ-XMAILINFO: NAOky/E1C/Nclcpu5VkYG1vTBuWNAHt5m+G2P9gB0cRthT44tF9E5uuCTFnAWJ
	 wFjlslstHjTMQyTdclY42xiBT/DTUoSdatKyLrVdTqP3mquNzg3uiF6Lb7Vh8y8SlNbasa4cf/33
	 TITcphAB/FqDDDHsXHX3XpwVPASVjYOjbkSghaHG7lcae0dkJneg03f5APlw2JXjqMtmD1sF0Odi
	 JSJrpbjN3M22grsuVTRjLXv9Tfjj1g3iChjpYydoprlXzBuFnDl25c3Tj9RtPlsHMsUEWjY6uX/V
	 zSiS2WF3p/PftpAot0wWLs+8JbkHR7bOmDhI4GytDG8IWpe+zHrgZKnamsmIYwvCrVv4ENAE3x22
	 v7rxCHKvTDSzNXLV3KTZNkEnFwbmvLWP0Azi3Cp5Y5akpdsYQInB3nyGqSfFVt8jL5YfAFVTwBTI
	 BZz2V8tNnjZbZ6V0tr60IIw9A5W7A6UmF0LcHbSf4PoG1UUv8a9nQ9fdpNi29i1w7LMgFCY/qJwL
	 mrJ7fifvg8G6UuvqAWqJDAhUbICD6Gd/a3wQVD/e5nMDzRTQS/dDBZ3GQ2iJFtuKB7JZ6Mroc9eO
	 5Oc4HD4yxxVrEX8pK+LH5sZcRnIMrPu08tddAXAXI05VyJEpg8o1Qhvmg15XxZBQ2EbjBFi9mB/u
	 j6iQHI7cr17kAJYtGUK6i/wgvTZ25FsvgKPfCF1eCNazsLDxdga5gxhbmKCo/6GfozujS9+WSuxS
	 6tESsut0QXns4SqkvsThDJSQMztzoBP4zCLNgsf6H/9h6eR8Sh6mtLWlBZ7LulT/QUflNIShTM+7
	 xrpQC650W0WsQeZb8O6JOjSbWDUyI7alCfzzPF/t1mlRTGth2PKVoqaXusittNm+K2LMOJyoE2Un
	 5AeeEKHHj7qpSq0LHuj2CD+nLCSsC10DAimAtBsx2E7hYa1+V2EyipGS0qKyCGBXcgiCTUjiyq9e
	 e3bNwGO5xdcBTlYmcpd+k1ydlKQ5RmMowkJIco0F5CplltR9jYqv8Aqsvyew/embU49+IbPiJt8L
	 RnCd+VUspfKKcXdW/MVgmdBinxsmtKPKKB8rQw0gvtVHqKMipo2daJ7gmxF1wDs2jIh6qndQli5G
	 aDFnVxFxoKOw8VhLE=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Yemingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rafael J. Wysocki <rafael@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drivers/base: return bus_add_driver() errors
Date: Tue, 20 Oct 2026 15:19:20 +0800
X-OQ-MSGID: <179248076034.35741.5616451991601763372@qq.com>
In-Reply-To: <2026102017-irate-stalling-aba6@gregkh>
References: <2026102017-irate-stalling-aba6@gregkh>

SGkgR3JlZywKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCj4gRnVsbCBuYW1lPwoKTXkgZnVsbCBu
YW1lIGlzIFllIE1pbmd4dWFuOyBJIGhhZCBpdCBpbiB0aGUgRnJvbTogbGluZSBhcyBhIHNpbmds
ZQpsYXRpbmlzZWQgd29yZC4gIEkgd2lsbCB1c2UgdGhlIGZ1bGwgZm9ybSBmcm9tIG5vdyBvbi4K
Cj4gQXJlIHlvdSBzdXJlIHRoYXQgdGhpcyBpcyBnb2luZyB0byB3b3JrIHByb3Blcmx5PyAgSG93
IHdhcyB0aGlzIHRlc3RlZD8KCllvdSdyZSByaWdodCB0byBhc2suICBJdCBoYXMgbm90IGJlZW4g
dGVzdGVkIGF0IHJ1bnRpbWUsIG9ubHkgYnVpbHQgYW5kCmNoZWNrZWQgd2l0aCBjaGVja3BhdGNo
LiAgSSBsb29rZWQgYXQgdGhlIHRocmVlIGZhaWx1cmUgbW9kZXMgYWdhaW4gYW5kCnRoYXQgaXMg
d2hlcmUgdGhlIHJlYWwgcHJvYmxlbSBpczoKCiAgLSAtRUlOVkFMIGlzIHVucmVhY2hhYmxlOiBk
cml2ZXJfa3R5cGUgYWx3YXlzIHN1cHBsaWVzIHN5c2ZzX29wcywgc28KICAgIHN5c2ZzX2FkZF9m
aWxlX21vZGVfbnMoKSBjYW4gbmV2ZXIgcmVqZWN0IHRoZSBhdHRyaWJ1dGUgb24gdGhhdAogICAg
Z3JvdW5kLgogIC0gLUVFWElTVCBuZWVkcyBhbiBpbi10cmVlIGJ1cyB3aG9zZSBkcnZfZ3JvdXBz
IGNvbGxpZGVzIHdpdGggdGhlCiAgICBidWlsdC1pbiB1ZXZlbnQsIGJpbmQgb3IgdW5iaW5kIGF0
dHJpYnV0ZS4gIE5vbmUgb2YgdGhlIGVpZ2h0IGJ1c2VzCiAgICB0aGF0IGRlZmluZSBkcnZfZ3Jv
dXBzIGRvLgogIC0gLUVOT01FTSB3b3VsZCBuZWVkIGFuIGFsbG9jYXRpb24gZmFpbHVyZSBhdCBl
eGFjdGx5IHRoYXQgcG9pbnQgaW4KICAgIGJvb3QuCgpTbyB0aGVyZSBpcyBubyB3YXkgZm9yIG1l
IHRvIGNvbnN0cnVjdCB0aGUgc2l0dWF0aW9uIHRoaXMgcGF0Y2ggaXMKc3VwcG9zZWQgdG8gaGFu
ZGxlLCB3aGljaCBhbHNvIG1lYW5zIEkgY2Fubm90IHNob3cgdGhhdCB0aGUgdW53aW5kIGlzCmNv
cnJlY3QuCgo+IFRoYXQgY29tbWVudCBpcyBhIGdvb2QgaW5kaWNhdGlvbiB0aGF0IG5vIG9uZSB3
aWxsIGhpdCB0aGlzLCBzbyB3aHkKPiBldmVuIHdvcnJ5IGFib3V0IGFueSBvZiB0aGlzPwoKQWdy
ZWVkLiAgSSByZWFkIHRoYXQgY29tbWVudCBhcyAidGhlIGF1dGhvciBnYXZlIHVwIG9uIHRoZSBl
cnJvciBwYXRoIiwKYnV0IHlvdSBhcmUgcmlnaHQgdGhhdCBpdCBzYXlzIG1vcmUgYWJvdXQgaG93
IHJlYWNoYWJsZSB0aGUgcGF0aCBpcyB0aGFuCmFib3V0IHdoZXRoZXIgaXQgaXMgaGFuZGxlZC4g
IFdpdGggLUVJTlZBTCBhbmQgLUVFWElTVCBib3RoIHJ1bGVkIG91dCBhbmQKLUVOT01FTSBiZWlu
ZyBhIGJvb3QtdGltZSBhbGxvY2F0aW9uIGZhaWx1cmUsIGNoYW5naW5nIHRoZSBlcnJvciBoYW5k
bGluZwpoZXJlIGJ1eXMgbm90aGluZyB0aGF0IGFueW9uZSBjYW4gb2JzZXJ2ZSwgYW5kIGl0IGRv
ZXMgYWRkIGEgcmV0dXJuIHBhdGgKdGhhdCB3YXMgbmV2ZXIgZXhlcmNpc2VkLgoKUGxlYXNlIGRy
b3AgdGhpcyBwYXRjaC4gIFNvcnJ5IGZvciB0aGUgbm9pc2UuCgpZZSBNaW5neHVhbgo=

