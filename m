Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A288221FC6;
	Sat, 19 Sep 2026 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789831140; cv=none; b=H4g4iPPXl4rWgpPCrbLFuWpdUD2Uj6SF90gwH3sqU8gGj7y3FeQuVkkEbU6inm/heCz+TjrNYfqGlSUpNjc9vZuLmunai612Ce7WqAqFjptyCrGy/HOnRPSph/jbim46XR0X0LPUs7CsRZt/Y/hDPLNpIbSeyul01ZCHGCIhLTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789831140; c=relaxed/simple;
	bh=FF+sUXGaxDjwItzvZTxbniE3mfHwZUTiYW2dGIDQpbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gsrauXAepyK/vdxnlzdLRsQurmcU3VI9ALukCslFk8E2ZbwuzrftCfXgOBjsLA968r1k8htT0OmnOt40yNmwywDXOmDSqhjnWKrVNPIQfCQSaRbCsHFYTHCBv1Yr04CxX+OlhZtLW4ZqI1m6JBmwPZN9GCG3q1F/LqyOSyx5jcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li; spf=pass smtp.mailfrom=gmx.li; dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.b=LiF07tmi; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.b="LiF07tmi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1789831135; x=1790435935; i=arc@gmx.li;
	bh=DH7J+SE0flSCu6USYiWN6ZnQP49DIsaF8LQ12rBOd/M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LiF07tmi8cXefYuBuosPiY6jErK2qIMIui2niZNEFD5ta9tT1V4gk+T3tRoxeSSP
	 4zqF9KNblULA1e5jN13tX4mKgCzr4goKUgNqFvxKSXz1ddWp+35FTGfzskYUkpey2
	 gzgVuxLI3z3+4fUvreJgLbf/B4kDf9Yo/4axM+yyHs5pu0b4KG/Rt+WKBaQeGBPKI
	 g66vBK3PhuTzAIyIVyRDfd8F/z5UuGUMevPdAyZH2O1Xh/qHYLiD6BAUv/UmA3b+t
	 tM1X9/aFVMje6HVN6IyPKwKGEikCqECaIjBs6A1lNDIPQrKjAlaajPFVfNMt40joV
	 QcxVuaFAsR4IVTheUQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfpOd-1wb6zH432n-00e5Sh; Sat, 19
 Sep 2026 17:18:55 +0200
From: Christian Ruppert <arc@gmx.li>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Christian Ruppert <arc@gmx.li>,
	Will Porter <mrwillporter@gmail.com>,
	Peter Drabik <drabik.p@gmail.com>,
	Neil Andrews <neil@androos.io>
Subject: [PATCH 1/3] Fix Audient EVO4 master playback control name
Date: Sat, 19 Sep 2026 17:18:38 +0200
Message-ID: <20260919151840.24371-2-arc@gmx.li>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919151840.24371-1-arc@gmx.li>
References: <20260919151840.24371-1-arc@gmx.li>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jT0v88nRGdM55SKcRvFTWfiGuMQhjLGsHhhZm0oY7QKLr+siK5T
 UvdeQxq8hTyAeh/uTwwOBU8NIho6MYMht1Lzi34NXGP5Jth6v/N2dFBp1H8xX7R2fe5Q/yw
 gM+Rw6umtNn+/FQe1h8Knh9A6QSgjoo+rbKMoGSyhuNUkvwpnzdjzRR7cDaVAQxkbMYdPGL
 aKxiXIsVaBwP1gLLyGexQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2uYRF7ZXO5w=;cjftyrBumrNO+qztzfQCv8Dbq7C
 /Unu4pzDB4qp8+T9hpROZ91NwykQyuzTgsKmGJUe9MH0862KVr1uJM0Oy5Hccfg+EYK7S0VkM
 5wId85tp06zL/wcEICoKA8ug0Yw27YW+y+23DBaQSBFyFSlm3DK1FqVEM3k+VT0tajJKBrQvk
 X2hx7ZOe32vPXQ+UThzSsF8ik9LrBk5nN+21l2vO40Iul/WWf8XCXdtxWdqy/6VSAG/MCyzMe
 Dt2vXzNArSFM3HqN6bqMac52A7PDynSecsp0rXR6n3J294FnY6uAhpHHzSiv68FF7Jv9M05hC
 rGxojLvyuhveeqispfUMeiCbhuwPvTsNta/rhGl5hF9WVBSpvYyvYFgfjL4o5EZKAdKb4Uq3d
 LuFzUfpn7tdxuw2FE0JnX4x+FDhflVabaoGuN0xBXa5G2ctjT5aH2vaeYdmnhfF6zrzt6wIEa
 Gsgc7rS/Mdm3yAWpsty7nvv/IKtsJumQuxY9236q7crOAvDP18pE5N6UD36yETumCVfKQTkz6
 vTunqtXX+OOc6J3rPkYCunvd0IGYhMOelzTLy5gc0zXBE/z8YlEtC1ow89DtPdno/spBHuycZ
 haJTPhUjwLkpIS4w39Uu8mAenAR7E+i31Hp0Biyq+yaLF2wp3wDkjD3AcyQB2k+xLFKUAvLFi
 1H/Svm2yBMYWx/ddgiXbG/hTvsbvYiOMW7B90lktYqhjI4HS4yVsWxm9UNQvaNHZC7leHpxFW
 UQ2MSLUYPK4EcdCTnNuf1afCc8542yehqD9+ShAY7KESPWmztLG7uO0nplRiqGWWp9KaQlm8z
 2Xj1hEUn84T3r+qWw7zoV+9+fIBzEWQTaxZSg4eb3B/Io64VjiIJhkhGk8uf3URbdEkPvJmk5
 b1e9vgXAxTfPQ2RI5waMSGV1MUhq6ooTjRuzoo9n95hcj4hm3u5Rkg7KmISGcw4vWTkcJFV2U
 Rrjzmu2syCzF7tAkjzD5xdmfp58+9aZKbySiHe4IAJZ27AXPOAf/TdIGtw0v61ZuKHi31Srqy
 fnEEIAkm3sRXKYcY1+7hWYiA1/8qjaDdS4QL6hPHIZPjucsnU0aq1qXTOhhrQXw8F5UInjHM9
 6fWbU8o2owmImYQz4fyjiJsz/j0gXZXgRRr/tw9wD+ZYrq2060UVAcuuQc9lnSh6Ev8jOM7x9
 9wL7aj4T+U/5qJ0PjYreIHuPqY4CwfDa4sKJEMZ/GA8/jYSn3lEEFgw1zgQun+wXrEE4Ve9Xr
 2L/1lQ2ZYsO6Gf5bdj8z3mqT4H8WjqdUR5mJF3wNC6scIXj6KZaPYRonrOMzNdqFWO42fvBuD
 E09CPJsTihFDVSSXBvMH/sT1ckgVqXxbS2gedTWXwmdV2RUsrhH1Tyo4WZWLUmbHX/OKed+HV
 RkdKh/3BR4saSQhunzjQGqY4RZBabCEYd/syqWF2Udca3Efsevxo3T6tzNXar1W41y3JjLT3m
 ODsu2sQWgpHc7uNKW1PSa2+gBMVHIyGSCJOCYAPxyJ7fsmInZx1+TisRE+b84IHlrX0qO7KOX
 jI/iI4BO70wciHF3yxmXsOM6NTUfz/S7bjWzUKuylqYYxizZD+bHC8N34BYamS3ZUvjo3LglV
 6+JrDFmq02JYbXtdCqXa9U+9Zd/np5CKZKEr7Ivfz7a2CCn/PEQ5S1r1eWLxGvE4qg9Gzb+cu
 zCvElNBz12zfsOjSAZGvrpUu2UZIhy4w0e6ta9gfJEVgRW1nJn5CYWc+HLZJG2lwm5LupeBlw
 lGxx/ZQJrCBOK4zLdoB0grLihuFIFfwu19TyjqIQPui+DPjlNeLzcLKFlJKgbQ+eZRrV/VZXh
 GWY30DCYXoKG3ZowxwCxSj6jWD9gHLN2FkeUcjGFgD4SX/Qlioh7jJ2wqTqQ75WP0TxFhqteK
 l2B7r4tvvsFQc7GQmg7CiOOjsHjGpfGQpcDRabkb/klHV/tn9AbCzjCmnPnGRcntws1c55Jmy
 tgqCVshXQlOw1niZtWZODNwaQX13VCKwBMvMpsR0jEoQyQTKYokLDbp0sGgaDn8iXo+RmEKa1
 Ubb/bqpSvPNmwdChxYU8eC31j8Z8B/dOxHFEzWcCjaUB+dElv/I03NjDsRYC5I9Af1vK98Iri
 eC2xj6BsxzB/IAnavHmmzr3CCjrGiBaL2qvpcUUaT1zILwyCO1P8UGlKu9A9rauLYpKRKidXT
 7c8w0lT62VJt9HQ7kxyUObqNK5z1otwDiqZrTVb9CK9aXGZ4y97TsCxfrxdpBU5zzygC4hD3B
 AyPC58LEvC6L5tD/Qn7zY7sCNeILWYi1jE28Dkkie6u2iszUZIM6Fn+f1YHedfckS7mIXNWVm
 Hj/14zUrTwGbu5d1+9dk0X1FxCSSp0wU4TICQSmGsaNFgFHCzMtLU6k7VDoYqhv0RVUMjY5Qm
 rDC84z/96pc/fhPRExgElXHCnR8A7xxuFxZ7TyWZNr543rE/r7HljfF1krjgo96iwoeQujDnL
 jWrlUHGK2rH2AvaHoj4lqqcLG7634bdbxSTkAScAHn91iI87d7lTKKLUjsNSnlLhCiWprw7I3
 IL9y0dhVBz4c63Lv+MnFGuEPV1Mu7oL9t83CeU8SJMzjnCU58tpoGqmepW9B1x9o1nRbFHsiq
 F7t+/RrpPAmsLq+o7aw/I/7J5wbCAq4ESowHMTxTEBl6PzZAejq0UCjkHpq4JhYJgfI57nOE0
 0Ua51Kr+8/VBbrWWr/C9AEWBfq2hjSgL+qJhbbCHs9DJA6yVZiKe+rmKbcRdL/DQ30JOYrdWU
 SM76nCT+i1ab2BffS1syWts2dMZl17AM3zbI1z/9cQLE/K7iSHLhWkm9gB7SHrSS8r5GVxsOQ
 wCbrHr7WXy5fpiHC8LHSa/YArA9aA50AhB/84vp0rsnI7+lg9U2DXyIRD0SEj3gbbQN2L6JQm
 qxmHnRre65MV1FrlBIWA/mB7h8N16ehNeI6dpU6DE518ZcKCVSCua3W1KfigSi53zWhr1RUie
 IU+z+bRjm0bTDyH5exN8FNSniygAtq8tKorFwjHKEIuAWojuzFrPpTuZw5noivC8GQBsbJGGY
 LygkH6MuRdGItPyPa/JTFW6ahtLtaz8/tdIsSFViX31oADVPlFiPSvSb5vbhPSX7887Yv8LfD
 zDvfAZC2HscJ+3ab9piV5MZ3xIsF/cSBxr5XHq/x9WOhGPa7Hqibv0tJmdwGiNEe3YJ6yW3wb
 a6FOHBrsBnLThfZa8ywWTYBCicTikZBsnv4jNKz8gnYE5O0W/LyKlIT/qlrBXg7bYN172xkHT
 2Wv7kqKvpHM3QU75a6DKcM+V68zqFyrgVPqDE3ZxOUh0Y7G7oof2BGiGwhuGxvx/iGQegHH47
 d2NvA4DXyVf1RqMcvkoNItIp0UmdPsHkau+kwbp2n8n+3ltOFu/nPCcKDcAX/q4sSVzDr2liB
 ccHdWlr4Gyu4sV+1cM13N9xcelBUIYBVqSPFhiuVVNIvXvS+YKcP5uR46U5ddZLwjL/D3s6sY
 Cexu4c2qM7szruxlhD2t9Of3NB/ZcSt1fNwi6oW6x4V787lMnp8WNOTuhLkKfBVSAHBSwcnBv
 0LUngVYZ6lB0OponztEbvGZEOvjPU+K1zWGXwpM2qKGpCVWeQa7ncN2dJXA5nUBdvgiio65iu
 sM2uhcxgTdtHmtHTTe4HwtyDPD3XX32EWk4TCcDf2bLTKKH8h61aEBPV6pfsXWqpbnrAKNiQY
 Of6KrQsEii1+a3TzjlKO1RU5vp09/ecliJf5Q5Lz7S1sE6lBF0nXVKooT3sjVLx9cskPPTYdQ
 7GZHokGtv5+CV9z97+2wQpH3d0t7S/f3iQ9eS2onjliO+SzjEQPCVBgcwjA6aB58wZXmlTmfU
 ymwa+E+clAvH1XzwJmsRQheszB5tBMaNiMUaR8JyYkbVGl1vNAbywuhGG5fR4vqq4egoo6odZ
 0qpt+heWKtLveM6DxMcSYh/L7Pu2JX/g0qTbpjP3rcNLVUzJgGOfl+Avt6xRfKxsIfPAMLANj
 LGKhkXBp/EC8a/qdFsrXe2vRbuK0dxCFp8YoB6mcAsHEdTGPitbDLQJyM9YL2ciAeTYQlrAN+
 UCNPlzt9ggkhWtCtZIUxHuKWU0cu1CWsiqKsnek/ZjkiUJXThRchsQgpGsfQIMxE50V1eL3V0
 zXpudtPrJclKDHGWA07z2XMBxGpaPOmPa69GlydkX006kI6i45pBUzOJj1Mta2YyI/99z+oBT
 cjVeaEF5/eebN1AtoFFLs3VZuOqyIgkacYSt19EPo70sSoemBaXsaOFTZkuEQ7WE7XaUtzJsA
 /lX49LynuehaKZqXB/fQH+GLAj9pkZYKIPWwKKC9rVEDT+drDyV+lR+5bA5phVznU9HyTz6NS
 eRfR7s1oQUxd5gGVh0lyvQiYG0nEQv0BL/Dx2Tns62YfTtla23VF0FZC16emWd9Ff8q0I3SA9
 T/Y0z+hom3f97zFETRFDBGVbfx8dC8NlwHE7abdTf3WQ20ePVU4PFRj3bYZmntgFSjd78SrHd
 wf+0yiLKk6b0Ka2zncuSBJVS0G3sLMhG4JXoliz78ROo7eYjO+CU1LoxlMpAMS64rbFC+PoW9
 wVX5bZULyj3P7LXKPmCL0XnC2Iv1rIeLSobzeeuQZE8bLjIILceN+bCk6G/ctS5gVBSgTRiO3
 OyrNmfZQ+8pU9kJCTQAykqayCtibT93j9q8SC+XIYAW+KqXcdvZsRzyqdeN3ukTYe2M3+7YWZ
 O/9yljbD/R2gBP4jiE7obVZ7m6M5ON9TPFlJckpA22Gv4orbiusnPYp3tGzg21+lQzR/3oQR1
 wKa9j2cLYJERM5A6BrNp6EaplfP4C++WQllHXXkht9HHAobbmnCNhdnLKREWh2Y2j8hvd+Px4
 wcu0K2Nn8KWgn6lncIViZB6Uucb+SJLUBYMDTn/DV7F4AD2l4eBJCDYijUG92k8KahVltCZhb
 eJvYSQffMllOzWqMVcdZ6Pf0h3mqwFkRqWpWSSFGnaQfFXpgNRVJC8j99HZg1cyhE8QrSs/2R
 SD2amS3tcyoMgfY9VEKuAgGov+elO3FoUhPKr2wNZYfkUrSzxjgg2o739UipNzH4wP+R4fvIt
 lhbGMYTh6ItyJru/oTOLtTXSR8Xt1oyfOdj3o3uED+UvcBy+WxzsSS7GXMDD44W6TitP5Opx6
 LkeJkTWsxNvM7Q7N34wcjAAAwvCmYAxhXj2DGePxfnWp1dqZV9xnyzpRrkNX7uaYKjZdHgI0/
 fxlVNFJqdcy1gDzJJ2YI6lJQTjfLi8LrsTQWcom+OrkSD9x9kqbfLbr3HiWiFCaqTGCcwlRKj
 MgV/CIz4n2nnIQAAT5/FEl8TZZ23/neeKmXQwMVVio2wRjGGppby5bwS/NpCPI7fWAfbWcfNw
 ruKsdEkSpVP3GLz1mwKwmqJNu8GvyY5YTTE/d1trF18nIggGzEmY4ePNzlld7IisvKu+1GHof
 J7KSPVrQXAfDkLwvQDVlWa3wbZmtMpFuMy+0SUomcpGZ7TeZEm4Q0NCuUY79A+npNz2WhRClQ
 rwpo3E3pf3ZjOTiKhDIDaHNFOuamm2O13GDKodCCIk9UCGlRl/3n12dxgVdfzu+Hb3ePEOMa8
 GJVuLMOhFUA8EX/gcJ1UGqJ5Aibx4tOFf11EvyBVD1Un391wCbEymqkrfYa7g6FL4p55jYt3Y
 wj03PJGN7HPxcNfL6+5I+tuYMYEjkTCMWCNeAIF564/TIc0YPw9O81XhBZTV9Ir3VfjUk1xk8
 V0ozbB7uO6q9ZysfC95eHgVJBg0DjxXDMpQCzPzeHh95cNiENkO+/chN6ecsWzJdMenTsrNzO
 0KW9ugFNx749k6uNFIadYxZ99DQNAm247zWIOxUdujV86zIB13b+MXKZUQemvdBA3gPry+Q7W
 vGORV3vGjRaRwowMWl9tsAnPP9hfMxCOmMItQ5bjhUvogcZyBi9kkhUmJOB4gPEmkam6yE2o6
 3mdCBEZMEQfMZHTIORagtQrjoHtmMQTowPIkml86yuuGJVcOMTGLc/U/fULYbSfIJlRLMwvLZ
 wWq+/2nMRmkUgYmXu1ykhz5vpRBS/giRZ+oA5rdwdt4rUy+AZ/QCkZtIKVLYV4+OSD2ljd2Wj
 QvPff1PIaByut0XXOsiCpOynEKNZtYbQZwoEcyktTrygea55zeCCqfbL7WsxBtp45fuB66W9l
 UN9F/S130HvdRnux+UEQSGgfjb7sglgtOzxH84RCSRiXYvp+AO2cxrcHmJeRgtiyTxbrXV7Tp
 8HYottqwGrHOlZ9S0yZ5A2LpGvgi4ILGyTclKvlxyjugyoiDM5MG4S+58m74ao705h71Kl5be
 bAWBsCk6jZ0kJ7nE7rlrHUAoclRtiQ3QUmwYgWqNUV3BLDNLLJ1onKnPndI3QAaUU=

The Audient EVO4 master volume mixer channel enumerates as 'EVO4 '. Rename
it to 'Master' according to control-names.rst.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_maps.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 41454cb403d0..1a6ad776126b 100644
=2D-- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -505,6 +505,14 @@ static const struct usbmix_connector_map gigabyte_b45=
0_connector_map[] =3D {
 	{}
 };
=20
+/* Audient EVO4: Rename FU 10 from 'EVO4 ' to 'Master' according to the
+ * ALSA naming convention
+ */
+static const struct usbmix_name_map audient_evo4_map[] =3D {
+	{ 10, "Master Playback" },
+	{}
+};
+
 /* Audient iD14 MkI and MkII: FU 12 sits on the monitor mixer branch but =
is
  * traced through to the Speaker output terminal, so it is named "Speaker
  * Playback Volume".  On MkII it controls only 4 of 6 playback channels. =
 MkI
@@ -632,6 +640,11 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] =
=3D {
 		.id =3D USB_ID(0x2708, 0x0002),
 		.map =3D audient_id14_map,
 	},
+	{
+		/* Audient EVO4 MkI */
+		.id =3D USB_ID(0x2708, 0x0006),
+		.map =3D audient_evo4_map,
+	},
 	{
 		/* Audient iD14 MkII */
 		.id =3D USB_ID(0x2708, 0x0008),
=2D-=20
2.55.0

