Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793491251;
	b=eCeOGDSgbVTSD/IbYYS9yWpNAFyVhTZoxuRTYpwtiYGvevMHTVcp5QJh5ID2yFStP8NR
	 8XdI/zO7ddk5klNRigw4Tk7GvP/2sR8hB9RWc+XOAf3emPCyMUEChK2ZqM2CavzKb44qh
	 ok/hreaYrDfTq1nVA7DFnGHwCNc4ltyRnlJ/KcXcJPrIv5U8Cjoww2kUgnw7sMalnacHy
	 YkwrkgRodQm1NDoY2p8iUlbrUarvowAg4fhvAeYKaai29fKSO7FFseuCvghA99fCgiZRk
	 CQHGNHAHZ+46fnjpMbunwVux2wF1wWFvjaoWp9xxFYBLPSo0+Iyjl3LT9q2n4bhLJHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793491251;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=L9Siuj17wSEfC8KcZahhfET9+BTC29ainE4Mm/WZc3c=;
	b=P4X+BE1SNAdWBrfqX7jM2tXaEyKghU+neCwWycmM4Z14rhJNpGmhI6OhOjuAYDOJXfz0
	 0u5iZxlzugnFOPDR8CdKIEiSIz+w2xAv283pkh3kUQlUi335Muc6KQ5jZ9vbYU/B1ww7g
	 hpNiSEdSkqyR2kxQJrcNkR+osk8uz87cTrcV7pgi9EOki9KmOvzAnUWw1IxCzbwkJhTVZ
	 79a5IH/8X3WX20uyIpvDPORKCjywa+N4acG6S9qxWtto3vxgeuPFIjwCTNsY7Dp4H6FDw
	 1Ae+QgGreLPVEVexvTfB03BYA7vAjVqnOJt4muUguqDiuquWu/Pub4TF77qa8k9602A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=o2YWzLAr;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDC1606A32D;
	Sun,  1 Nov 2026 00:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FDC1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=o2YWzLAr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793491243; x=1794096043; i=arc@gmx.li;
	bh=L9Siuj17wSEfC8KcZahhfET9+BTC29ainE4Mm/WZc3c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=o2YWzLArXGNxekHe4LJdPv3IRNpkWjviUYYAL9WLVLMyOkGFU7a+txejssG4y5xE
	 qbA+0EGFhBLHm3A2EcDZl928xFF4eOVP2d2jmo8skn1A0C1mDXlFek1mJTaeTx7dQ
	 cmRAimAQ0TRqUnpvQA2h+g5Eip5cxvzK3KM5UHawXV6gF/yxSJOwBjeno2PxUtht2
	 SJsOstz6Et6gsMNmC6qeML5byMbCI+XWWN7X/zuMnLmPU+IAgm+0jPTCeLKJLamBi
	 DO2wzk2HXibg78yqz1++48IUqpgLJMNW7+K7jef8Xe2y9cU1AJTuikAl15HhV1Ore
	 yQf3zcoRvUKJpVzwfQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mj8mb-1wrZ9i2IUP-00q84v; Sun, 01
 Nov 2026 01:00:43 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC PATCH 04/11] ALSA: mixer_audient: Add length check to USB transfer
Date: Sun,  1 Nov 2026 01:00:06 +0100
Message-ID: <20261101000013.11880-5-arc@gmx.li>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101000013.11880-1-arc@gmx.li>
References: <CAMZ8TEw=rmc=H3L60j-o_wa0fNc9eOhG7ZY0SdttFf+p-qUfkQ@mail.gmail.com>
 <20261101000013.11880-1-arc@gmx.li>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t9ncs6APcjuG3hlKuSRzoKjDoXYalgTqfMzL+xYIunqUcV/SBht
 BIagpJhqQwD8W5keiK2I+Wr6bdlN3QG+AZgFKDPq0IL8GPbrQjNYiz32CR6VfsJzrLD4QUi
 EO8sutgt2Qp1/rZN6/TfjDiqXZnY7jEzXGtfZZui5LN07t1ZohKEfISq/D+effJ8nmdssZW
 59JpSg+LevbKlNByWK1Iw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dkAoic1Ok0E=;Jlhycbk/ME6geptvMUWL4pBQNz7
 Nctw4PHZNNEotcRBHUIbzFdHdu/iKuGRwPXCHPASGq60vhElPSqSJL+fDVEZu3IUH4EnJYLr+
 09XMEYV7zAIwvTQoTFwBda/q9QHT671A5MQop1qZ5IeJWORt/ViS/vdq4ruOh46/6DWWuDaf8
 GwZeiLhlFydiyHFxcztFQ0A11gx7rjyxip5GxADHiORgwbgYlTcAVfwlipPmF8XjRCaGKv6cV
 jNgp+HGov3PcoaINkP3fv2FmjymlzDbTdzpHh45/S9jM+xeDB2icp/KnkuRi2XMVrF0KiDcag
 iLK1/wHzhmtR2zovT02saBS9uFJaLxmn7ppxx7UohH0olV0fJA5qErEGr32vdoVYxSzbvoIrl
 hALiE7uQVScGtkTHwnZubDLsW5GNxdD3fkaULizmB6jtophvHTgpv00UEqR1WGx1oeKD8DdOM
 PXcXdW8Ht3HeuPcY2JGujPoiBeZyPsBAjin56zlAEjGfi9FPfkDStAqnMMGKQ33wrVmlVMFbF
 4a9WrOp5s6hqsTr1wotL8x9Z3kpfbZOzh4VxsrMQlVpXTAG0pBMRMDGvNMiIyxmZHnkpjTHeD
 +uw5DQ6fYUU2HF2xtn8SIMKDz29UgwtZfTK7xjafyMSp9U6xhzIQzggC9Mw5AJ2ZXUWE4xtkj
 9p9Y4fHnlfq+U43v/I4Y7K9/fK4MoasBsYv3j1MVl4DVEkI2DROsAGQHOZD2Y3k9R9Hpkt/4+
 xqZ3brLtkxCXAlgDpKCFrde+HdAKwrRMbRYJdwlvNpHJCRaYX1DHSNsMAMYWtzgrKlUnxFP7g
 UJLa+sezdbkhQcmud+0F3k3Sv2XMJ36Qliw+pX+RveYEpQ45dEL9IdnVRkE2logeSdUG7nIQO
 nYRhE+A8FV8DTLU/oP+E9qppZZkLKZpq+8irUTT59S4TEhalRiSnsenIloYo7uAglct0qSxLn
 K1Nf3QIlAr2poQQ+GQDjrudLzl083QQnIHRXphx0ntRO7+TLkW70oPa1VU21mh4Dt2qpeIijF
 pFkcNtO7YE8O1A+/qByZSdJvHD2g3bv4sKwNrj0IXQwGisWFGFCcW71PYnRdLxyte/JsTU2e8
 BbNM4TDHKVz4Sm5/JsoKSnsUm/+cJmC1TWVKd5tkwoM/SksVdmzuHDyHB/yqps7/3fUmWkeJN
 SSHQH2o5HUIuoZsIcU5rcNuqs/007X7VXGn7F8/E8n5MRYJkzOgsz2vBIKp6gd7kEze6xHW7r
 nX2CrmL2JSWn2kwLEBIEmn2QfvkSXX54okSrWZkUQgqqVZw4NUVShVLNCXNXNmW+prh2QHpyk
 SdB/m4bZ0LlFck9FX6tf0Ous49uWw7Xt4gw5Ph5bwQDyb4xUI/6zii5IU49scTJGCwJageL/0
 H3GU4ifwEjPxtL2T3g+yUQOHSuJ5+VIkBh+6/1YrumwbR2utBC31tPeScC1CBzLFdoGqn63rn
 60Awsc/qXmr3mdLqFq8GQ1b8XRbmX1HIMSQXFOwvZc3HLgxz93ayYbexkNVc0YNNdhSXULdNd
 jKScw9AC0o5FYTZ87/6YOQlhu5bkq1k7q+aMyUoVaVSnVh709drGuRk1QEX1lZddNeEfKDndB
 +kwUkPDnzjvX1L/tKUNim6YDVlAF9tf5NbDJci0HxtfARJ+M4CGSrAdGu23WoHBl7EsThHB0z
 JKZwqBQtIB3+Cwd2Z+x3dYj9iMEfMsP6sfo12iW5VITRdui0n1EKgUH9URelyMi+SppdDKNhU
 hxfj9UlvUTb/MvNKWBG1rfi3kBoAsVfDYpcw+sjwX7nkHW0fdIrx6UwTyClo10B6ami3inLX8
 OqatTkMHmt91MEK5LlFCMGfkCrvArIkQDntm0OIhmCMa1VTnI6lqAI+x+/z2+utDXN3f8+W6R
 DuqukoqdtZ9yy+uW++tPnC7nnZ5l1o+fASeO111/Rfh2nUE7jfP4rz0qSTkvOY6SQnyz0nNJv
 AKfs0Nz5e0wQ/eUr6aAp5KxRVLDOCDKK29cv2nCBYNz/+ztYYvLH8ciDW6UWCcS+ojZirIwfz
 Df4lcZQMpaz9dK+BMyho3pUEpKqMOceydjIhY1Hxjemryjtv22KhCCUYABpL9DSsNS+go0TLi
 fL9NadAx1cHbyS/jz/VXDl7SovQjf7Mn7dvaJmXTXOF5egGIhhKw1bq31Nw2aIiGG0RDA6A+q
 gAqLbKOatHIUCnPOIlZL1OJa3QCg0FekDgHQ7NlDws87iCF70BA7DMnn0+olnGsPj1FE+ewyZ
 dd8BwlkmhbQp/9NZh9dNsytOOg0xpfdPsmRSuEF1arkyIcTpyh1M6jvRiwDJE6FtFT+Lnxh3y
 Ir4am5FR8i4o9a0twRTNBeEWHrF9gXcevUkPF2ApedZG71MoHjexidTS9AAEskXhjP1DjIFNp
 EtPqwGSY5JwAGy9YHD4RZ41rQbk9CWhEY0/lHuoxNdqLg0+noZz0uy0UfrZPv4qpmhu4YY+Ql
 XdZItOB/WohdymtOUDSf3wIqJE/VgTG6rM1HEm76v2Hp/3oRTdn5P26nZtwNrJwEdG1JrCdzP
 2NACwV1YJgq93kiVtysWU5s7XwRXLmimELI7Ty4TeOCQCgtiXmu6fHPKu5zBy4M9LEqSfaY5B
 2YLcwC/8RyBTVL2u6j26Zu8ILAkawiBW3M5hBORzGXKeWsYMvp4Cz9ugDeFLQTxCIxnUAIECR
 R0XFk80et14A2STsAOOQIs7RSUIPh0uImhHXVEvLg2M+2qdhHSgXwwyzc3UbDrASjjAmEDoVl
 k4nQPdfPLE3uWqfztAGusoQhkO39gttHMs4ZJj55iJtvnZ0B8WGD2VWqYQAff9EWe396HF5dr
 ESm+CPZbprkfaiv6hT5256VanKI3Wd2rOnK8s1X5s5a7uHPmdVJ9UaRRw8WTUZJaGrx2zRDuj
 qwqwsR8Qr8zvzd6zQRJ4pIO8SnFZfegw8c+c2OV4SjO7QDNdpEY5QVKu4grhQWwwCP96toeWc
 ATDR5cfsSg8yejsp61kAIt6mE9Ji1Zu6Wj6cbWRmfHIEGZexDeqWDj0vXjp5UTrKj6kKt92X2
 36hEmGG7SZ4pwyQzSapzN1inh+cbihhpus1kb5JMuZfdvasvwiItZ/eV01wU7h5Jd1hfYMKOZ
 aP2Rk3n8hyCDjhpqirEhu8UvDrKkfzuCmMLZP/35MlZJG/pjxWh+99XHvNYHv/3B6MNiH6GOE
 jXk9MTkvdP/D2kHFDbOtdaQByeiZhZB4nWd3PFBtdEDtJIbl5i5ipa0pWcw2w82JEDWTAt1fv
 52j+lZPSj39+ZvKSv5jCAQMsQbG2KJHU8m+TS41ULEY0TAj5QHFKrC7+c6tXt3s5py0Ovrzqd
 zVR6Y1lyYMFVSSyYhnwi+wx7w4sne2VOyev3JPjrGFfMXJpZMYW4L3Hh6XlfVU8P8Q5JKf8GQ
 HY3d9uC//qybaiun5k4+2SUG8MuqCuC86MgtyGXAXYmNvfpQfOfZJI7R+zJ0LqW83302ULFVK
 XoIDdFq4A1H7ItXA0gDFJRLbxhIk2uK1iw9T36VxGo1KSypFJa7rlZveE1/0ffHq4HD4oPZgP
 nrdKe2m+oAAzFVEUqAjlrxE23ErDpHIjJ8w1O8JwboeiaIOWvcsHwP6oihgFRtF0Lm77h5TXd
 TzeUqxd0H0fqBlQ7INvj9V2j0yd4ar/22iXL8kVgl9w1FvC96gJtPvny+cey4GcY4lpF8r0nT
 SbP3e1nc1WnqabIMC46me5O0O1N9r1X7Gb4nK83aogjV3clndPOabAhdnND24FHYK9vXpb2L7
 cEUCzdB1OpyZgO8OstB03oGe4IgnSzDfuEjACTmhv4gO5dNCowCCNuSP3CVKG6O5YtxZCqqVL
 f8qx+nkLvqGApcBoJEpO3C21ZcaePT9SVSma0s7K9bnM7N7hRxk+DPwULehtUILM758AqIrjW
 YCNM0EH/by/JpXsjjwD+iXBqWvkoz/AriKtxs16QjwsDzm2qA0WeAKUy/09V5HTcTzLBPYugA
 tiHaxWgrlhdtqyzQXsIQ1dJvVzQQos2nzqINLbprW5zBRZMe2cedCpLygqYGHg0/ODtaA9Ud7
 pVhkV+e1AWnu9phn0gZYONivE2WhRjTv7tZ15kJdx1YkubzacvGug+t4jxmR2VkHc2U6co34b
 cuNamCc7iDWDqiZ+qQelJKlwXgWQhq29SkVyKAZbhaQVahVM7dxz7BdwIggYfA8fDptsNl9A5
 p6SnDH0GnhkSlnP6xgkIWGkyHDFtz2zBC6j5NTtIVhXq06dwoq5/KY/9NDTnwq6qR3G0u2SrB
 3wstvtwHGTYIs6ZW4+bJMj5DukKccU+wjmhVpRylgYGo0kFvwx+mV8JcKJ2naorUFCMyi8QLJ
 /BNYd3NvxYQUOiz995b0KWGSi3ohGzd7fo4VAq8BKLl9AdXlyFFpaqDxstfu1Apq7Uvk0HWmk
 FhGoU3hMvQaHvmhFleKpqrwwTyjw12266sVnldNzUaHiLi3ZbFnjngjxaGDkQ8bdYWKLKfZ+q
 X43wMsFffMiATwzL5qREYf5gUuNUxnMmZToPspsp3AgsuavVJ9exue4BI/jei7VALX2LnXeVi
 154dmI66XPZQTeRPVykNzldvc0GUwmMuNyIWVju0Jt96aMCAalIGImNKSbDs94JYhajdeWGDy
 uPHJrya4iXbfqGBxs/w8BgTPnKr/xP/J3Vrt38iOeqDJjiOixeIDEW58SbXUpluOhUVrtStEF
 tR6CRWny3xSvW6ctkV6ZIsX2gITxaxg3Tj71D2FT3VGDXC0E+Ay5igKFKkku2rNQYM7kMX5op
 WQzZsE3dbhY0hnE1rE7PoFGn+6B67/BlrpOAEJkKzUWthACcQABw0XsVfzOvC59k+YY7IQg/W
 v04TZa696pULIsOQtC2c+Dr3GL6Ti2wWedqYPOeH/1Q2D12tcHZsNi8+uDBQsCH+fphgOwBVI
 tRKpbhUyHyqDN6Tc9MwcZHb6yxztFSQksydGQuBbz6sUTviTdmTwtocFhwrbLk35xbzbKpOx8
 aVbf85wi51TlUDmw2Q4M+VH/P4JZVo5vksy3WNxWRftXs6Y6MB8gEnUTyWC6HKYn7drLsk4tP
 Y666lO2DjRmZreOGz+1IZmO1LsBn81A9gEO0ZK38+BpwF3tC4/hXEI4eKxAX14uqG9ncVaxZp
 ZERanCo4ploKQ+1Mqhd33K7/FMSgGvHh9Pg25O+3fVAUgpv9nARXd79T8AJ/yBXtH3w8YAnk2
 Nz31RjowfzX1cZKUs9SPRXBRcY0w8/cAPS1gj8cYl7mofcPGANlQjbt9TpveHd+6lWc2VbkID
 XTBbdJ7mp9fdgfBmITbUbhkvXigu8F0cY9pW0as8vBxs61yQ4y8iMPTCfqYQuwNrveQfaxW3T
 cT4AOZzOp+kfESQWSmGK0a/Rwnst/0D8IKHSa00/jc8A9xji7/G2cYbnoYDg4PDqst3kTobLr
 AaisRyskfzmdp5dQOHAhbxj4V1FE3NWyTjtLItWXC4fYF4CdakwPqWBAHJuN8GBx2TxeO4rJr
 7DyvHJQUQKdTlwM6eiPaiPHxd+JOWlNM3nEPzBmZesX7BZnQrizcXTCq9YakvoRbIabwVRm/O
 ceCyQHT9cD1Z2wx8tZiQ6fSeSZIliLq7Z/4UYuvU6EOclXSwCTrAvbD3MJ6rwZinjEBvYfDYh
 07qrCLddQ6zlkBs/eQzJ7mRGVhX2P0C+GphwXqDMpPvD3zZywpx8h2+jlk0NN4D7zZVKEDbxm
 oWaM+guKp1fG+y6OkpWItzROWUiIzp47ANSwrWhDhOVYJI0mkPr94wPkBma2LlvN7yZbgPBm4
 iI3l+59iHmWzjQkNgpzkUxF6ougMem+sKS9ri1jiT6PzM+EwsFhM4lm1a8Rr/bGTjfRNeU+Cf
 Zrx0iBfOlaPRs3BdtW6xgY0h16jJ0DtgtrZGvkGbcxCkQHEkBfMolLTPRkOzlXEiVRWv5+wv8
 7yg4tftorVfzeMMZONX3ynXuH2AH8NS6R8YnXNwLcbd9+XQpPWO7f1W2GhqnD5T7V1QLVGJsd
 qixh3xx0NVmO1Pol+yAXiX6X6qMG0cX4EToc9C4hztinE2MFADFS6ZKHgt4okLZES0NbogOLl
 WkLQWZpbHx5khFbbLFuYQlhjJQdvxv5XuPWJB5xNpSWmrIE3/0UeXXhn6+efH+Kz5kk2BA0cH
 hdluzDmSuz63B2xb9XHPmwLDTdgr5K0IBKSekgl/ieXa7duL/c0Etcv1VL+Zsgvfa6JvO7S2V
 uuei107E5Zlw4jUopOlEGRBYCOd2uO/vmLNk6kD4QKZb/daOBwYHfXXqjWuvpEzeBy7L4ZNhe
 6UMhT9yE/R8L0OO4YGAKv6tLYEQA0+WIanG6kurGdf62Lm1hxxnOkhSu9a3K0SYQb4mTpIhz0
 5CySxgivbS0b4tUGqxvpzwxhlpppJQ6H4sAI7L8UNOgcWHwl7iZXcpxyMkhnZAEVQt1q2zgoe
 dA63NpI4HyVgik4Jj7grWXkO0MGDhSIzCFDCOB4rayjbxdiQFMfBeem3Vxz9slJDBJMV+w6xv
 EU4QHwzRk4URba8H7bJ71OtUHPiMOGEC06RC9rmyK4Chx1v9TiTrWu7qqHHF2knu5iYp8bWan
 tgIVzMilsqYi3cWXcm09LJSFQDRH5xIQgG0lpHfkJgnGZmL0iSA1DMqUEtSdPZ8p05HgHpVGu
 yuaC7IBL5MXirgSS0/ywccFH1gIoeFPPViacTdSxMAzl6+I8ordlw83vGapfn9MJQPpYF2SdV
 OCWrx2maouYNagrMJvhYYE2mMntv51uasBXORUFPrAmn7FQdepLjLp6PmG0mpbSRKZiVNLk/W
 /z+P0ThbrXEFycRUgTQs6uC1JB/82t1R4syEL+4z4iqHFVFcZpL9x5cKf8kUYqvqY/URjYEGY
 63eCCWnhIG87l5+Stb8wA00s2Fog8FILHItLo34IJRgyaa/j5m+H2jKuKQ5nhsh7qE66etiRS
 DGMo7K4hfHT5lGh2FbRJ3gXsJ2N8A707sj241qnDiRcHv0NBFLb+QLrQwIWB0HsttL2u1rtmz
 VXxzzrHuYnmoeNrk//cYvm+BBYLEb6Na66KyieXOsiTihWnRoSv+q51zSU34fILpf/Oy8saBR
 j0KSAJaw2Ioxsb1pHnSiVpsgGf7OUtD6AXWMmQKQ41OsMszbYVn5e2/N8agimErsqS82vGSJZ
 29lthvAsmrcT8CXauf37hwzJV7v8oTHB4i7AiLgVNMLfWJMXz3zb4xgTGWmLoRTUIeczhQd71
 cGjOl/+e4RIPBjFYqBBfhyvDq6EvjAoYVqG4PZw656NyNJQp/HWCk1F/BlKDl9zQF8HXEie+R
 4sdorMTGK8PwZ6bcMvbmyCB8GQmvMx80pPfsEPr9t/wXBj5o9FoyHxhYR1CTWTb8KFPAVjyow
 2x4vROePgY9dX6hafS7sxxF25GYyENZwwUrbZH5Gmi2ziZSYUISSEgjCg/9F79gnq9ipQkZR7
 Feio8UwSwl/Ybzv1HiAvCvmRAK0/sBeXYBocV6Y8JWwXW8APcVQfFYn/mEsEv3wsZIpvtrxcc
 0uGePCG2Fwb+ry1EzKw==

Check USB control transfers not only for errors but also for expected
length and return -EIO in case of error.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 82591c32140f..24d2f7a0bdc2 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -244,9 +244,14 @@ static inline int snd_audient_get_cur(struct usb_mixe=
r_interface *mixer,
 	const u16 value =3D U8_U8(sel, cidx);
 	const u16 index =3D U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
=20
-	return snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
-			       UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
-			       value, index, buf, len);
+	const int ret =3D snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
+					UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
+					value, index, buf, len);
+
+	if ((ret >=3D 0) && (ret !=3D len))
+		return -EIO;
+
+	return ret;
 }
=20
 static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
@@ -258,9 +263,14 @@ static inline int snd_audient_set_cur(struct usb_mixe=
r_interface *mixer,
 	const u16 value =3D U8_U8(sel, cidx);
 	const u16 index =3D U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
=20
-	return snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
-			       UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
-			       value, index, buf, len);
+	const int ret =3D snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+					UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
+					value, index, buf, len);
+
+	if ((ret >=3D 0) && (ret !=3D len))
+		return -EIO;
+
+	return ret;
 }
=20
=20
=2D-=20
2.56.0

