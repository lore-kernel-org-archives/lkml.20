Received: from mail-oa2-f13.google.com (mail-oa2-f13.google.com [74.125.231.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8A344E650
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588079; cv=pass; b=BOmCNpbTP0FCMOIiYEFfkDQ9gTeI16mLFe/CPfuTLrD8honR/9ww4XxE7HrRUh7COZe+ySZn1hVwYQD1ZJqP5cIaogi9cwFK6uuT33F7GBwyumY2xaWGJcL1JKfK8y4iwoEiciqRuAtN9v7T/0m16TJYOgHPsmgkJu2ATIrGJrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588079; c=relaxed/simple;
	bh=Fb514aLYgLP3mkuWT2tDoRukpRtQJoehFyogUw87l5Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pRiKYTjfnHtWEZvj4WkDG8XEviMKkWs8hhmDuOeYJbxgFykt2ORDTOORGKeeb17QopApn/TDHo0yftPwS7Osd6ZrFotADY5YpXJ82K0mp2eK6yr2EJ1Cdp/l6zCeEcCIQob4KVGuoSYKkPVg8RrcCqjVbWYuFb6Syj6B2IP8frc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jbn1B7j/; arc=pass smtp.client-ip=74.125.231.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jbn1B7j/"
Received: by mail-oa2-f13.google.com with SMTP id 586e51a60fabf-466ccdd7695so1092156fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790588075; cv=none;
        d=google.com; s=arc-20260327;
        b=IOmMLlDCEKs6+YNcRxKcrrYApVZD0hsIYIQ1edKkemQjvX0aC7BaFG9nljqLmSS3fO
         FU0MyCp7+zsRR58/GBXf365ug1T2CVK8m1hbSJQYFV0ZbdWIuueQvIbinBLGhzW3lB/w
         ZNekLpEHzmkn7kqu4lEmli4LDDaydhAOp9D4NaDLW54hyqsa0OYemLPU/Fw1nwpr6moU
         ++lRqZuv4ndKl+oEGrQRwQHOesOCj6j4TNmkty2+YTPxWArPjnSCzbXcov07iVR6SeB6
         Z2TAMci5Nyql0u9o7eQYy3q9cRcRb1ZvxbhY1gF9xlZvRF0qOjXA6zsJmxzbdS3TdXJb
         ih0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Fb514aLYgLP3mkuWT2tDoRukpRtQJoehFyogUw87l5Q=;
        fh=DkF0SomAXrD/Ux7qcj17RwGqLzy3nSUtlYW3dhmDWFs=;
        b=r6Q43z8NuaTkLCnUssFm3Wq89aMcS5nq5bJTcxDz3UGr/fhNzA8eG+7ANKCfpHQaX8
         AwAWF7RqUPMgfCE8wt2ALd8kB1LiRX5E2NOhis/FYuylvcV6qMgEDREFGd4jtU9Pg6h+
         pMWJWaE/kC0hO5zhavFP+6Sl+RY9GptcZWW3rGEnJ6RpeG4NgULjBswiR2EpBnKBfvSU
         lCV0iw4ghJJsAK0xG6fSE+u6aVdryBwMMpAOIWLPmPy83LeCcYRMzmakqLGrkQ/p/a7n
         Vq8yPQWV2DIXUqyjV0YG2CfL9lkduR1Aq+ZvXNzQbsLuPXag/Qd1NAhEzYWuUCkwGT8c
         Q7mQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588075; x=1791192875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fb514aLYgLP3mkuWT2tDoRukpRtQJoehFyogUw87l5Q=;
        b=Jbn1B7j/wIrV18eW1C5Gl7+RFbHU8QKr4172Qdvz8okRCufaGZWBzFzuempRoZltW+
         eV8ndxuSeqG1gLSQkioALBl6kdlyLXIaUuo7zaBb/u6s7I89QIctpuaGmQbF1BaZGS8w
         JwWYcGliW3j6J6h1Yh0QyVmk3EAdeh4Z22CvsKyUEmrwS1X9XCi0upUjh7uRjZ5o+Tqo
         Q2Vm70KC6YvukCVg4Mpkzwj6saQlBXp/pA0Jb5S6bp/le7zGMFJh3h8DZiZr7ZJ6y07W
         99tB+dGgvb3ouzsZgXgsTwBa9R7enxeHb5wn5oLVs2dZnH+ZpoxQa0LJjtFHpRJ49Fyu
         bjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588075; x=1791192875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fb514aLYgLP3mkuWT2tDoRukpRtQJoehFyogUw87l5Q=;
        b=Lk+nVxuHKDYrXIZMuKW+hvhtQR5HW7DC2PsmXcl3E7fB40Sp2V8ZDREM0iSk0z7hZs
         r9orH6XGBcPC5ecHhlCHZ5sjITNuQhEOZiyhRutLldQXPMJNfcNsCQHmQA+eITW+bbbL
         Li+X4E3o762VQFtN5wJJLtMmD/9n7kPoslAbW8zM8HwFU+rrJOPrvkZXjQLqEZ7WP3gk
         RgzGkCoZ9Q//a0cXR1gl8z5xmpwLOp/ODY2vuejfJQstHjqsEBAQMrE3+DdYY3yvp9jk
         1JMcVN5SIhZ8zxD0Aw8fulSa2T5h1VmtAfBY7SbZkO+/xiQG85dywrrrTe6s8JJW4yGe
         o+0A==
X-Gm-Message-State: AFuF++kdRitJc//nPyVy7r/45Af9QALJm9mriQgcg0UZDlLgZgEKu7fd
	t9NTAittZnHq0CGpko5u+02WPMQVhRg8mwkIuAUj7SAlsIlXagZfL5TUlEQySa5ftxeIXF+A7Xm
	nla1BZoyCBeYiBfCQC6TD4YsKcZBwpDlj3bee
X-Gm-Gg: AYBFou17tdwVCFo0LTETPjloAVw/FqU9xHUI+PHzv8/Guh3V8VpSjmSNYejT8+UxSZ5
	Tp7UgHnkmT2EZ1dObcYzohz+hxWd6qIa+LktBMYGUpda/0JMiU+YveATzlSogxro1weVgusHkYd
	EXjMhTK9jXXq858b549x+bOwC24u3fqC5rYs2qSiPVuxnquHxmJi67xiKfWG45JQMceCa0f77Gx
	cin19qXpUK903eeUsyWVBzHDEDfJ0nnJd+ohelPvtWCGnCp9yQF2MnpZQFJN4eqfaPEj8sBMnAO
	4XszfWcNBc/PylZVN5kRxz8C6aWYXLjjaQZocXYCR2Mpi2Rn4Na2cHY=
X-Received: by 2002:a05:6808:448f:b0:4c4:9f7e:92ce with SMTP id
 5614622812f47-4d72c738d10mr12663670b6e.38.1790588074888; Mon, 28 Sep 2026
 02:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Mon, 28 Sep 2026 11:34:23 +0200
X-Gm-Features: AclHuK_M7hsV6mDXB75JLb6K13SofnEO1ckpvXSSa7ERxYqgDNDZocwhUgbqqsQ
Message-ID: <CAMnqnYxiXKZOOOCjWEijLaQuBsMELM3q3VKhTqrkd0zX-1zyWA@mail.gmail.com>
Subject: [PATCH v2] docs/zh_CN: add Chinese translation for usb/ohci.rst
To: linux-kernel@vger.kernel.org
Cc: alexs@kernel.org, Dongliang Mu <dzm91@hust.edu.cn>, linux-doc@vger.kernel.org, 
	corbet@lwn.net, si.yanteng@linux.dev, skhan@linuxfoundation.org, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

VHJhbnNsYXRlIERvY3VtZW50YXRpb24vdXNiL29oY2kucnN0IGludG8gQ2hpbmVzZSBTaW1wbGlm
aWVkLg0KDQpUaGUgdHJhbnNsYXRpb24gY292ZXJzIE9IQ0kgZHJpdmVyIG92ZXJ2aWV3LCBoYXJk
d2FyZSBwcm90b2NvbA0KZGlmZmVyZW5jZXMgKE9IQ0kgdnMgVUhDSSksIGltcHJvdmVtZW50cyBz
aW5jZSAyLjQga2VybmVsLA0KcXVldWVhYmxlIGludGVycnVwdCB0cmFuc2ZlcnMsIGFuZCBub24t
UENJIHN1cHBvcnQuDQoNClNpZ25lZC1vZmYtYnk6IEppYW1pbmcgT3V5YW5nIDxqaWFtaW5nb3V5
YW5nMTNAZ21haWwuY29tPg0KLS0tDQoNCkNoYW5nZXMgaW4gdjI6DQotIENvcnJlY3QgdGhlIGRh
dGUNCi0gQ29ycmVjdCB0aGUgbGF5b3V0DQotIEFkZCBzcGVjaWZpYyBkZXRhaWxzIGZvciBpdCdz
IGNvbnRyaWJ1dG9ycw0KLS0tDQogLi4uL3RyYW5zbGF0aW9ucy96aF9DTi91c2IvaW5kZXgucnN0
ICAgICAgICAgIHwgIDIgKy0NCiBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Iv
b2hjaS5yc3QgfCAzOCArKysrKysrKysrKysrKysrKysrDQogMiBmaWxlcyBjaGFuZ2VkLCAzOSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KDQpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL2luZGV4LnJzdA0KYi9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2IvaW5kZXgucnN0DQppbmRleCBkZjk5ODE0YzY0OTcu
LmM5NmVhY2YxM2UxMSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3VzYi9pbmRleC5yc3QNCisrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L3VzYi9pbmRleC5yc3QNCkBAIC0zMiw2ICszMiw3IEBAIFVTQiDmlK/mjIENCiAgICAgY2hpcGlk
ZWENCiAgICAgZHdjMw0KICAgICBlaGNpDQorICAgIG9oY2kNCiAgICAgdXNibW9uDQoNCiDlvoXn
v7vor5HmlofmoaPvvJoNCkBAIC00OSw3ICs1MCw2IEBAIFVTQiDmlK/mjIENCiAqIG1hc3Mtc3Rv
cmFnZQ0KICogbWlzY191c2JzZXZzZWcNCiAqIG10b3VjaHVzYg0KLSogb2hjaQ0KICogcmF3LWdh
ZGdldA0KICogdXNiaXBfcHJvdG9jb2wNCiAqIHVzYi1zZXJpYWwNCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCmIvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2kucnN0DQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
aW5kZXggMDAwMDAwMDAwMDAwLi41ZTM2ODMxYmYzNzANCi0tLSAvZGV2L251bGwNCisrKyBiL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KQEAgLTAsMCArMSwz
OCBAQA0KKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQorDQorOk9yaWdpbmFs
OiBEb2N1bWVudGF0aW9uL3VzYi9vaGNpLnJzdA0KKw0KKzrnv7vor5E6IOasp+mYs+WutumTrSBK
aWFtaW5nIE91eWFuZyA8amlhbWluZ291eWFuZzEzQGdtYWlsLmNvbT4NCisNCis9PT09PT09PQ0K
K09IQ0npqbHliqgNCis9PT09PT09PQ0KKw0KKzIwMDLlubQ45pyIMjPml6UNCisNCivigJxPSENJ
LUhDROKAnempseWKqOeoi+W6j+aYr+S4gOS4qlVTQuS4u+acuuaOp+WItuWZqOeoi+W6j++8iEhD
RO+8ie+8jOWug+a6kOiHqjIuNOWGheaguOezu+WIl+S4reeahOKAnHVzYi1vaGNp4oCdDQor6amx
5Yqo56iL5bqP44CC4oCcdXNiLW9oY2nigJ3ku6PnoIHkuLvopoHnlLEgUm9tYW4gV2Vpc3NnYWVy
YmVyIDx3ZWlzc2dAdmllbm5hLmF0Pue8luWGmeS9huS5n+iOtw0KK+W+l+S6huadpeiHqkRhdmlk
IEJyb3duZWxsIDxkYnJvd25lbGxAdXNlcnMuc291cmNlZm9yZ2UubmV0Pu+8jExpbnVzIFRvcnZh
bGRzDQor5ZKMR3JlZ29yeSBQLiBTbWl0aOeahOaUr+aMgeOAgg0KKw0KK+Wug+aUr+aMgeKAnOW8
gOaUvuS4u+acuuaOp+WItuWZqOaOpeWPo+KAne+8iE9IQ0nvvInvvIzor6XmjqXlj6PmoIflh4bl
jJbkuobnlKjkuo7kuI5VU0IgMS4x5Li75py65o6n5Yi25Zmo6YCa5L+h55qEDQor56Gs5Lu25a+E
5a2Y5Zmo5Y2P6K6u44CC4oCc5LiO6Iux54m55bCU5pep5pyf55qE4oCc6YCa55So5Li75py65o6n
5Yi25Zmo5o6l5Y+j4oCd77yIVUhDSe+8ieebuOavlO+8jOWug+WwhuabtOWkmuWPquiDveWKn+iD
vQ0KK+azqOWFpeWIsOehrOS7tuS4reOAgumZpOiLseeJueWwlOWSjOWogeebm+S5i+WklueahOWF
tuS7luS+m+W6lOWVhueahFVTQjEuMeaOp+WItuWZqOmAmuW4uOS9v+eUqE9IQ0njgIINCisNCivo
h6oyLjTlhoXmoLjku6XmnaXnmoTmm7TmlLnljIXmi6wNCisNCisgICAgICAgICAtIOaPkOmrmOS6
huWBpeWjruaApzsg5L+u5aSN5LqG6ZSZ6K+vOyDlh4/lsJHkuoblvIDplIANCisgICAgICAgICAt
IOaUr+aMgeabtOaWsOWSjOeugOWMlueahHVzYmNvcmUgQVBJDQorICAgICAgICAgLSDkuK3mlq3k
vKDovpPlj6/ku6Xmm7TlpKfvvIzlubbkuJTlj6/ku6XmjpLpmJ8NCisgICAgICAgICAtIOmAmui/
h+S9v+eUqOS4iuWxguKAnGhjZOKAneahhuaetu+8jOWHj+WwkeS7o+eggemHjw0KKyAgICAgICAg
IC0g5pSv5oyB5LiA5Lqb6Z2eUENJ55qET0hDSeWunueOsA0KKyAgICAgICAgIC0gLi4uIOS7peWP
iuabtOWkmg0KKw0KK+KAnE9IQ0ktaGNk4oCd6amx5Yqo56iL5bqP5aSE55CG5omA5pyJVVNCIDEu
MeS8oOi+k+exu+Wei+OAguaJgOacieexu+Wei+eahOS8oOi+k+mDveWPr+S7peaOkumYn+OAguWc
qOKAnHVzYi1vaGNp4oCdDQor5Lit5Lmf5piv5aaC5q2k77yM5L2G5Lit5pat5Lyg6L6T6Zmk5aSW
44CC5Lul5YmN77yM5L2/55So5LiA5bin55qE5ZGo5pyf5Lya5Zug5Li6SVJR5aSE55CG55qE5byA
6ZSA6ICM5a+86Ie05pWw5o2u5LiiDQor5aSx55qE6aOO6Zmp44CC5b2T5Lit5pat5Lyg6L6T5o6S
6Zif5pe277yM5Y+v5Lul6YCa6L+H56Gu5L+d56Gs5Lu25Zyo5pON5L2c57O757uf5aSE55CG55u4
5YWzSVJR5pe25aeL57uI5pyJ5Lyg6L6T6ZyA6KaBDQor5aSE55CG77yM5p2l5pyA5aSn6ZmQ5bqm
55qE6ZmN5L2O6L+Z5Lqb6aOO6Zmp44CCDQorDQorLSBEYXZpZCBCcm93bmVsbA0KKyAgPGRicm93
bmVsbEB1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+DQorDQotLSANCjIuNTMuMA0K
