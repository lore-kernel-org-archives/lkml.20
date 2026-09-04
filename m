Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5CC3D45F7;
	Fri,  4 Sep 2026 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511102; cv=none; b=kMKY2xZJA/gaJNruAVQd/gg7Efpu9UpYbgpZRS3XI0WPJYuB/QNbWLzR1G/l4TMRnHSd/DnTDJ5DwSJZg6PAYA37OGLmhw9WcsQxuBEkCHaUNF4Wd/wRVZFHmoEMmluV3vlnFye+VseG2uvrenunkjAue9B4A1lvvwcUQLwOIbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511102; c=relaxed/simple;
	bh=O9Wm7IIkNGWTM+cOxwal8+SgRd907iNaJMRzg3aDFwY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=J1n/ha56NscHB6o+gAdlCzbLjjAcE5cJ41mFDOxLN/ksxM/5Yx13HLHyjjBKPvWHOCMxWraWLl5ZpKQFHN7BMwWzmcejxedwSBve02TxRQhqqGnBrD6quJGF9eW/mDJmSNo/yb68DbQcvCIBGA6tskxsU2Frcc2xhE7AwfCujjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=I+MBZ/mK; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="I+MBZ/mK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=O9Wm7IIkNGWTM+cOxwal8+SgRd907iNaJMRzg3aDFwY=; b=I
	+MBZ/mK9+IIt/rT+7YppR/8uP0eRST56nCaFncBpwcm4pwSEDBC4YYY9USwCHoo5
	10uFYI9NSar8bsVHufKdQbXtFifM/xKAvItxaK1ghawTlci5vj2hZuOpM45J2Bca
	zGMPvfMXUZmjI0k+RxAwkPic4cudehS0qUUVZlYHX8=
Date: Fri, 4 Sep 2026 16:37:52 +0800 (CST)
From: =?UTF-8?B?5Lu75rW3?= <rh_king@163.com>
To: "Ricardo Ribalda" <ribalda@chromium.org>
Cc: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, "Hans de Goede" <hansg@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] media: uvcvideo: Add quirk for Luxvisions RGB Camera
 (30c9:0122)
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <CANiDSCse5+Ke-Z2321F_QHJZX2suCKxnBy5WuNHE3m1wjoxX-Q@mail.gmail.com>
References: <20260903081145.8382-1-rh_king@163.com>
 <CANiDSCse5+Ke-Z2321F_QHJZX2suCKxnBy5WuNHE3m1wjoxX-Q@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <42a544a1.3e7.1a06b912fdb.Coremail.rh_king@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gygvCgD3v2Rgg5pqNOkIAA--.5470W
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC+wA66Gqag2C85gAA3g
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkmbmJzcDtSaWNhcmRv77yMClRoYW5rcyZuYnNwO2ZvciZuYnNwO3lvdXImbmJzcDtyZXZpZXcu
Jm5ic3A7VGhpcyZuYnNwO2lzJm5ic3A7dGhlJm5ic3A7b3JpZ2luYWwmbmJzcDtvdXRwdXQmbmJz
cDtvZiZuYnNwOydsc3VzYicKdGVzdGluZ0BmZWRvcmE6fiQmbmJzcDtsc3VzYgpCdXMmbmJzcDsw
MDEmbmJzcDtEZXZpY2UmbmJzcDswMDE6Jm5ic3A7SUQmbmJzcDsxZDZiOjAwMDImbmJzcDtMaW51
eCZuYnNwO0ZvdW5kYXRpb24mbmJzcDsyLjAmbmJzcDtyb290Jm5ic3A7aHViCkJ1cyZuYnNwOzAw
MiZuYnNwO0RldmljZSZuYnNwOzAwMTombmJzcDtJRCZuYnNwOzFkNmI6MDAwMyZuYnNwO0xpbnV4
Jm5ic3A7Rm91bmRhdGlvbiZuYnNwOzMuMCZuYnNwO3Jvb3QmbmJzcDtodWIKQnVzJm5ic3A7MDAz
Jm5ic3A7RGV2aWNlJm5ic3A7MDAxOiZuYnNwO0lEJm5ic3A7MWQ2YjowMDAyJm5ic3A7TGludXgm
bmJzcDtGb3VuZGF0aW9uJm5ic3A7Mi4wJm5ic3A7cm9vdCZuYnNwO2h1YgpCdXMmbmJzcDswMDMm
bmJzcDtEZXZpY2UmbmJzcDswMDI6Jm5ic3A7SUQmbmJzcDszMGM5OjAxMjImbmJzcDtMdXh2aXNp
b25zJm5ic3A7SW5ub3RlY2gmbmJzcDtMaW1pdGVkJm5ic3A7SW50ZWdyYXRlZCZuYnNwO1JHQiZu
YnNwO0NhbWVyYQpCdXMmbmJzcDswMDMmbmJzcDtEZXZpY2UmbmJzcDswMTE6Jm5ic3A7SUQmbmJz
cDswNmNiOjAwZjkmbmJzcDtTeW5hcHRpY3MsJm5ic3A7SW5jLiZuYnNwOwpCdXMmbmJzcDswMDMm
bmJzcDtEZXZpY2UmbmJzcDswMTI6Jm5ic3A7SUQmbmJzcDsxN2VmOjYyYWYmbmJzcDtMZW5vdm8m
bmJzcDtUaGlua1BhZCZuYnNwO1gxMyZuYnNwO0RldGFjaGFibGUmbmJzcDtHZW4mbmJzcDsxCkJ1
cyZuYnNwOzAwNCZuYnNwO0RldmljZSZuYnNwOzAwMTombmJzcDtJRCZuYnNwOzFkNmI6MDAwMyZu
YnNwO0xpbnV4Jm5ic3A7Rm91bmRhdGlvbiZuYnNwOzMuMCZuYnNwO3Jvb3QmbmJzcDtodWIK5Zyo
IDIwMjYtMDktMDMgMTY6NTk6NTnvvIwiUmljYXJkbyBSaWJhbGRhIiA8cmliYWxkYUBjaHJvbWl1
bS5vcmc+IOWGmemBk++8mgpIaSBLZWFuDQoNCkNvdWxkIHlvdSBwcm92aWRlIHRoZSB3aG9sZSBv
dXRwdXQgb2YgbHN1c2IgLXYgMzBjOTowMTIyDQoNClRoYW5rcyENCg0KT24gVGh1LCAzIFNlcHQg
MjAyNiBhdCAxMDo1OCwgS2VhbiBSZW4gPHJoX2tpbmdAMTYzLmNvbT4gd3JvdGU6DQo+DQo+IFRo
ZSBkZXZpY2UgYmluZHMgY2xlYW5seSBidXQgZGVsaXZlcnMgbm8gaW1hZ2UgZGF0YTsgVVNCIGF1
dG9zdXNwZW5kIGlzDQo+IHN1c3BlbmRpbmcgdGhlIHN0cmVhbWluZyBlbmRwb2ludC4gRGlzYWJs
ZSBhdXRvc3VzcGVuZCBmb3IgaXQuDQo+DQo+IElzc3VlIGZvdW5kIG9uIExlbm92byBUaGlua1Bh
ZCBYMTMgKGNvZGVuYW1lIFplbGRhLCBJbnRlbCk7IGNvbmZpcm1lZA0KPiB3b3JraW5nIHdpdGgg
dGhpcyBxdWlyay4NCj4NCj4gVGVzdGVkLWJ5OiBLZWFuIFJlbiA8cmhfa2luZ0AxNjMuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBLZWFuIFJlbiA8cmhfa2luZ0AxNjMuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfZHJpdmVyLmMgfCA5ICsrKysrKysrKw0KPiAgMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRp
YS91c2IvdXZjL3V2Y19kcml2ZXIuYyBiL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfZHJpdmVy
LmMNCj4gaW5kZXggZTI4OWNjNzFiYTk4Li4zMmJmMzUzMDEzYTEgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfZHJpdmVyLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS91
c2IvdXZjL3V2Y19kcml2ZXIuYw0KPiBAQCAtMzIxNiw2ICszMjE2LDE1IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgdXNiX2RldmljZV9pZCB1dmNfaWRzW10gPSB7DQo+ICAgICAgICAgICAuYkludGVy
ZmFjZVN1YkNsYXNzICAgPSAxLA0KPiAgICAgICAgICAgLmJJbnRlcmZhY2VQcm90b2NvbCAgID0g
MCwNCj4gICAgICAgICAgIC5kcml2ZXJfaW5mbyAgICAgICAgICA9IFVWQ19JTkZPX01FVEEoVjRM
Ml9NRVRBX0ZNVF9ENFhYKSB9LA0KPiArICAgICAgIC8qIEx1eHZpc2lvbnMgSW5ub3RlY2ggSW50
ZWdyYXRlZCBSR0IgQ2FtZXJhIChMZW5vdm8gbGFwdG9wcykgKi8NCj4gKyAgICAgICB7IC5tYXRj
aF9mbGFncyAgICAgICAgICA9IFVTQl9ERVZJQ0VfSURfTUFUQ0hfREVWSUNFDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCBVU0JfREVWSUNFX0lEX01BVENIX0lOVF9JTkZPLA0K
PiArICAgICAgICAgLmlkVmVuZG9yICAgICAgICAgICAgID0gMHgzMGM5LA0KPiArICAgICAgICAg
LmlkUHJvZHVjdCAgICAgICAgICAgID0gMHgwMTIyLA0KPiArICAgICAgICAgLmJJbnRlcmZhY2VD
bGFzcyAgICAgID0gVVNCX0NMQVNTX1ZJREVPLA0KPiArICAgICAgICAgLmJJbnRlcmZhY2VTdWJD
bGFzcyAgID0gMSwNCj4gKyAgICAgICAgIC5iSW50ZXJmYWNlUHJvdG9jb2wgICA9IDAsDQo+ICsg
ICAgICAgICAuZHJpdmVyX2luZm8gICAgICAgICAgPSBVVkNfSU5GT19RVUlSSyhVVkNfUVVJUktf
RElTQUJMRV9BVVRPU1VTUEVORCkgfSwNCj4gICAgICAgICAvKiBJbnRlbCBSZWFsc2Vuc2UgRDQz
NWkgZGVwdGggY2FtZXJhICovDQo+ICAgICAgICAgeyAubWF0Y2hfZmxhZ3MgICAgICAgICAgPSBV
U0JfREVWSUNFX0lEX01BVENIX0RFVklDRQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgVVNCX0RFVklDRV9JRF9NQVRDSF9JTlRfSU5GTywNCj4gLS0NCj4gMi40MC4wDQo+DQo+
DQoNCg0KLS0gDQpSaWNhcmRvIFJpYmFsZGENCg==
