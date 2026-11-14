Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794617053;
	b=QMrnrAem6nQzLv25GIx+edH+ioUVjTvqlQ5k4igtDWwnPZtEdME0Uh2LLzupaFumjOXb
	 qiBGYHARJEvBozEbZx9lCN2r3D86lPvhuJsIJs39flDPU7QeKSmzePbW37WS2rTsey0Kk
	 aX+3yGOq+E3HYOGZWcV+lPySeIY7L9kYPvsIrWn3IsR1fExwmi0aN++XLFMwe8Qt+J5a8
	 9FR0vzuapoBB4dtiy0Phkja45uNdKwLFTmqw7rUQgI6iNqqiNwVxpx0PV1dp9+amox4kA
	 1bUT+y5uA7/GGlYKfG9KNpGFTsrvb35N0FQeri8k+MMZkXeu8p0TBZB0EdcJuj0ulgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794617053;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YmxDCB0txYq55lNE4Q9A1BVGErbr4G/vZzPr5xJTeuc=;
	b=ga6PUDX3Nd8DloimEdCmeFQEWSy/crEyNLlqoG1DWawr0RldtGN1dSVHLcswgcafsNdO
	 Kb1Apgvb1sBrHuZDm3l/CJe6iQrv4mPuYhqr8tFjz/6FzV2x1fliNWBwsI1kUYxNHKFpI
	 2gwecf8QYoooYL/DfALhRsCQN8EOqPH+9pHRdDeWk/ll4nRxsg3a2mS9JUGVbjcIwMVV1
	 rgQFX5sVQQYgJzdQATJuhnBt2ZU7Y+YWYjJT/5rwsuAxF0Bm9LTmh5kNesjJR6mGxtHTE
	 2VkqrU6jvYhnTTatClLp8ZdtjTPR0ZNRINRX7OasEJBfsfMbNOPsS3PzPpIbWaPbvgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=efWCLS6W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C15606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=efWCLS6W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059D91F000CD
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794617052;
	bh=YmxDCB0txYq55lNE4Q9A1BVGErbr4G/vZzPr5xJTeuc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=efWCLS6WUirN00J0a8tqEhSeUf1kmYaBlu5CKQLabsoZGEbXzuqAJKB8TMX9JPNAa
	 Nborg/c2LsRv41LwPsso8Ia3L2VTEPWMxvSK0uIwh669eksi10toY4MA75uau2UFWX
	 SnAxqmzYIO4b/mgXHMC8yzoiH2JiLPj+55wglkGhegvKv4u5XNBmLssyOVv8ssAMkC
	 //JUVNHRa18buo66G5jzjwG8nxgmWx7GlEoquRGmIwyEfnCmMYYAi6XVDeDq7yuZqu
	 Zr061TZStsia3PumpHtt3v45aDbv5QJ3G9CDcOQ/ewrLw33oprzmhYWqdb+l0w8EXh
	 4D3TTrX9COKyg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso366949066b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:44:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFQLuvNYzdKvb1cyrkoCrBTPP/Lvw00yzYUzEPZHI8KfTvSJJJYhLZYFeN+MT3S7vu//dIjUojchYaLRks=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dl4rtLbidvb5+Syp68kv3QTIkQTMRTy6TrUyVFEoSH+fO/eq0
	wV7SIBE4WgZTHTfcxkIpV3Fh+viSrRFtUbZjzrzoHskbmC5fJiLBlqllxOj2yqZA6MwWrTPCNqn
	GKPNDlOvY67WA4CNzZhWQofyWiSArlAI=
X-Received: by 2002:a17:907:3e07:b0:c4d:4d5b:849b with SMTP id
 a640c23a62f3a-c50963408demr378661066b.19.1794617050597; Fri, 13 Nov 2026
 16:44:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-smb2-sign-v1-1-937ee7c20f08@gmail.com>
In-Reply-To: <20261113-smb2-sign-v1-1-937ee7c20f08@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 14 Nov 2026 09:43:58 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9un6yV7fq0oPL3KAxdZqKDq21pT040aZGaGpsxKfvd+Q@mail.gmail.com>
X-Gm-Features: AclHuK-d6sLchv89JefHGOSkJ35jFjOK9BF0xm0q8BhaARXpTJWG57E-KBI5Fw8
Message-ID: <CAKYAXd9un6yV7fq0oPL3KAxdZqKDq21pT040aZGaGpsxKfvd+Q@mail.gmail.com>
Subject: Re: [PATCH] smb: client: fail SMB2 responses with a bad signature
To: shyckless@gmail.com
Cc: pc@manguebit.org, linux-cifs@vger.kernel.org, sprasad@microsoft.com, 
	ematsumiya@suse.de, smfrench@gmail.com, ronniesahlberg@gmail.com, 
	bharathsm@microsoft.com, linux-kernel@vger.kernel.org, 
	daniel.birtwhistle@gehealthcare.com, samba-technical@lists.samba.org, 
	tom@talpey.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 9:00=E2=80=AFPM Suyuan Wang via B4 Relay
<devnull+shyckless.gmail.com@kernel.org> wrote:
>
> From: Suyuan Wang <stevewong@hust.edu.cn>
>
> smb2_check_receive() checks the response signature when signing is on,
> but a failed check is only logged:
>
>     rc =3D smb2_verify_signature(&rqst, server);
>     if (rc)
>             cifs_server_dbg(VFS, "SMB signature verification returned ...=
",
>                             rc);
>     ...
>     return map_smb2_to_linux_error(mid->resp_buf, log_error);
>
> The status from the response is returned as usual, and the caller goes
> on to use a response whose signature is wrong. This is the path for
> synchronous requests and for smb2_writev_callback(). On a signed but
> unencrypted connection, anyone who can modify the traffic can change
> e.g. a directory listing, and the client accepts it.
>
> Return the verification error instead.
>
> Unlike the SMB1 fix in commit dc96f01d54cc ("smb: client: terminate
> session upon failed client required signing"), don't reconnect: this
> runs in the thread that sent the request, and only cifsd should call
> cifs_reconnect(). And fail the request whichever side required signing,
> since a response with a bad signature can't be trusted either way.
>
> Found with a static analysis tool and checked by hand.
>
> Reported-by: Daniel Birtwhistle <daniel.birtwhistle@gehealthcare.com>
> Closes: https://lore.kernel.org/linux-cifs/SN4PR22MB28883DAF57E0B4D4BFB1C=
22AEEC42@SN4PR22MB2888.namprd22.prod.outlook.com/
> Fixes: 3c1bf7e48e9e ("CIFS: Enable signing in SMB2")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
Please check Sashiko's review comments.

https://sashiko.dev/#/patchset/20261113-smb2-sign-v1-1-937ee7c20f08%40gmail=
.com

Thanks.
