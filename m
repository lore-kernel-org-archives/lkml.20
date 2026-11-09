Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205948;
	b=2crHL9eB7IAsjtBPkMgz4lJHlFB/7w2NMy+JuYfdT2gGb9gdIr/K/wkBJ2rDs6FWrsV2
	 MyWs2FGACCExjzKNnOQe8veJFwrtN6mqYl1RGm/5kQD8mZ/DqrkJ8Xpw9mznnE/WfVUsa
	 tAIJfMNrrW8C++196eb4LPTnekeY7hAfmvHeNnEiqpyX7i3mMg5T2sQTZNELhHfgs8+53
	 cohRlxAdfi7rC2axcEQODE+yIzSIEewvGQsrNoPWe+0P1Oe8M9N/Xu5Xu8qSwEEpHNYp4
	 T/hdMhquMP8sbSLeqZ/GLFAYTkw5ENSRZW2peQtJESROOWVetPpK50EGrqxKePiB+SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205948;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=LYC6phoo/HG6IzCEVa7nSJN6fn2Jgm/piiC8Mqdg3HM=;
	b=gSAA2+ac7GCwxXq8OqQxvrjlj3AZmU+Tocx3FeMquCTifVcs3vS3NbxBrTuCdNXtWcz+
	 0mPcQS1qzl2DnyGBnzw21hSwt21DMV747jgHBfNipbI0i9jWDBhrkuM8SZbErL7Lq/JJf
	 u0XO+5/l1+gNlBRSLW43ekDPtwJKdAPxTU6Z1cSr71pdJSxijLpdWVPtXGNei0xaWBIlh
	 ni0iZXTampm1k6zPQ6Leb1IwB0jvaQG8Aw3YNOweA0tm0RIp5VSvrE5iCKYFPWuM01cEB
	 zzuBMCdwp4weK6QscEMVXpBfcIFtIAHl+vr472YvnQWLor527nISqdr4nwJQKhqSWlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=EXK1SHyQ;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD5B606A31C;
	Mon,  9 Nov 2026 06:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD5B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=EXK1SHyQ
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A96WDkG44114969, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794205933; bh=LYC6phoo/HG6IzCEVa7nSJN6fn2Jgm/piiC8Mqdg3HM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=EXK1SHyQ740vk1qKMjydMzy2zP0lpdBNNKJhBRHonHb1REstR4y5HKWPQJwwOrU1F
	 5Gbm91wVq4s8ahTrxW4DcHu1RPkmWaTiyidwyZGVDxvzXp3dmtsK4yTQMbvA1zo51o
	 iaLcN5MWY7Y+/1vCtZc43V80/+vG5RqGYu6Wav7rzM2yMxeaEp2wbOhmASJRgrbywL
	 eLh4+xkJC9YatZR72ay8wBB/bdmhDDU2P6Gwd5RdXyOhOcAb1ubSoiEToDxok084W/
	 5FaofX2S8Vqc5T2uaW0S7amPV/oKSdZbuV0iVW2eDPU+Dz7W7ZeT/312svZxoAAP2I
	 ATqdmOTSBbD8g==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A96WDkG44114969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 14:32:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:30:52 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 14:30:52 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Luka Gejak <luka.gejak@linux.dev>, Kalpesh Solanki <skalpesh942@gmail.com>
CC: "kvalo@kernel.org" <kvalo@kernel.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 0/2] wifi: rtw88: firmware recovery fixes and LPS hang
 handling
Thread-Topic: [PATCH v3 0/2] wifi: rtw88: firmware recovery fixes and LPS hang
 handling
Thread-Index: AQHdb15tzENGiXbpUkmLg1jSpFrwf7clBUSw//+124CAAIglsP//fRYAgACIQ+A=
Date: Mon, 9 Nov 2026 06:30:52 +0000
Message-ID: <39750c895e3b4dfa8ef98a28503f25fd@realtek.com>
References: <20261108085126.331784-1-skalpesh942@gmail.com>
 <9fd1c42c5df94629a21c41dd08645b96@realtek.com>
 <27E9A60D-26F6-41D6-B74F-7DEF998C8498@linux.dev>
 <86803b2c13a74ada92ab73e79f38164d@realtek.com>
 <B1CD522C-2CC2-4913-8175-05F0D25CF65F@linux.dev>
In-Reply-To: <B1CD522C-2CC2-4913-8175-05F0D25CF65F@linux.dev>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

THVrYSBHZWphayA8bHVrYS5nZWpha0BsaW51eC5kZXY+IHdyb3RlOg0KPiBPbiBOb3ZlbWJlciA5
LCAyMDI2IDc6MTI6NTIgQU0gR01UKzAxOjAwLCBQaW5nLUtlIFNoaWggPHBrc2hpaEByZWFsdGVr
LmNvbT4NCj4gd3JvdGU6DQo+ID5MdWthIEdlamFrIDxsdWthLmdlamFrQGxpbnV4LmRldj4gd3Jv
dGU6DQo+ID4+IE9uIE5vdmVtYmVyIDksIDIwMjYgMzozMDo1OCBBTSBHTVQrMDE6MDAsIFBpbmct
S2UgU2hpaA0KPiA+PHBrc2hpaEByZWFsdGVrLmNvbT4NCj4gPj4gd3JvdGU6DQo+ID4+ID5LYWxw
ZXNoIFNvbGFua2kgPHNrYWxwZXNoOTQyQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4+ID4+IENoYW5n
ZXMgaW4gdjM6DQo+ID4+ID4+IC0gTm90ZTogdjIgcGF0Y2ggMS8yIChETUkgcXVpcmspIGlzIGFs
cmVhZHkgYXBwbGllZCBpbiBydHctbmV4dC4NCj4gPj4gPj4gLSBBZGQgcGF0Y2ggMS8yIHRvIGNs
ZWFyIFJUV19GTEFHX1JFU1RBUlRJTkcgaW4gcnR3X29wc19zdG9wKCkNCj4gPj4gPj4gICB3aXRo
IEZpeGVzIHRhZy4NCj4gPj4gPj4gLSBJbiBwYXRjaCAyLzI6DQo+ID4+ID4+ICAgLSBDb3VudCBj
b25zZWN1dGl2ZSBmYWlsdXJlcyBiZWZvcmUgdHJpZ2dlcmluZyByZWNvdmVyeQ0KPiA+PiA+PiAg
ICAgKFJUV19QU19IQU5HX01BWF9DTlQgPSAzKS4NCj4gPj4gPj4gICAtIFJlc2V0IHBzX2hhbmdf
Y250IG9uIHN1Y2Nlc3NmdWwgTFBTIGxlYXZlIGFuZCBpbg0KPiA+cnR3X2NvcmVfc3RhcnQoKS4N
Cj4gPj4gPj4gICAtIFN1cHByZXNzIHJhdyByZWdpc3RlciBkdW1wIG9uIHRyYW5zaWVudCBmYWls
dXJlcyB0byBhdm9pZCBsb2cNCj4gPnNwYW0uDQo+ID4+ID4NCj4gPj4gPlRoZSBwYXRjaHNldCBk
b2Vzbid0IHByZXNlbnQgaW4gWzFdIG5vciBbMl0uIFBsZWFzZSB3YWl0IGEgd2hpbGUgdG8NCj4g
PnNlbmQNCj4gPj4gPm5ld2VyIHZlcnNpb24gYWZ0ZXIgaXQgcmVjb3ZlcmVkLg0KPiA+PiA+DQo+
ID4+ID5bMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVs
ZXNzL2xpc3QvDQo+ID4+ID5bMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtd2lyZWxl
c3MvDQo+ID4+ID4NCj4gPj4gPg0KPiA+Pg0KPiA+PiBIaSBQaW5nLUtlLA0KPiA+Pg0KPiA+PiBU
aGUgbGludXgtd2lyZWxlc3MgbGlzdCBpcyBidWdnZWQgYW5kIG5vdGhpbmcgaXMgYXBwZWFyaW5n
IG9uIGl0IHNpbmNlDQo+ID4+IDIwMjYtMTEtMDYgMTU6NDYgVVRDLiBBcmVuJ3QgcGF0Y2hlcyBh
Y2Nlc3NpYmxlIGR1ZSB0bw0KPiA+PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIGJlaW5n
IENDJ2VkPw0KPiA+DQo+ID5JIHRoaW5rIG5vdC4gSSBzZW50IHBhdGNoZXMgdG8gbGludXgtd2ly
ZWxlc3MsIG5vdCBpbmNsdWRpbmcgbGludXgta2VybmVsLA0KPiA+YmVmb3JlLCBhbmQgdGhlIGxv
cmUgYW5kIHBhdGNod29yayBvZiBsaW51eC13aXJlbGVzcyBjYW4gY2FwdHVyZSB0aGUNCj4gPnBh
dGNoZXMuDQo+ID4NCj4gPg0KPiANCj4gV2UgYXJlIGhhdmluZyB0aGlzIGNvbnZlcnNhdGlvbiBv
biBsaW51eC13aXJlbGVzcywgYXJlbid0IHdlPyBJIGRvbid0IHNlZQ0KPiBpdCBhbmQgbXkgbGVp
IGlzbid0IHBpY2tpbmcgaXQgdXAuDQoNCkkgdGhpbmsgdGhlIG1haWxpbmcgbGlzdCBzdGlsbCB3
b3JrcywgYnV0IGxvcmUvcGF0Y2h3b3JrIGdvdCB3cm9uZy4NCg0KDQo=
