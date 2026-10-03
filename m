Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C45423788
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 12:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791030614; cv=pass; b=UaOg8WMBeoc0nyOu2wbypUurnmuS2Jtj0zb5siPg7CBj6jq3rEZYusrOktSLJuqOPfMEtruSF1QSrL3ok6tMsPeIjOdlXB8eovLtYJx2J50n3KunhZOiNmWmdtos9T0m/hhkW0mLxtg854vMSE2ltZEXp3cz01uu/OmDVlBUDA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791030614; c=relaxed/simple;
	bh=hqSobSxH9p82Pc2pQrLeLMglXwWqgyXODZAnb8rNodY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alf8kBrUHEaY00nMO+8hAMlvtDf52u1qy8EaiGXF8/ee4wfz5PWERNb5ZMTGF0guh5yCsuxDikqPaJbgcitMpL7UA+Yp4yMxETyAhwRex4kp+Qelztnkkm3oxUKEiW72CsoRJPt2tRkQSJ8MyZn6Tc5tCy+v9tuCDZLrny2a9lQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICHEts7r; arc=pass smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICHEts7r"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-1431a73fa1eso50023c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 05:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791030611; cv=none;
        d=google.com; s=arc-20260327;
        b=IyLPBiGIL68YVjekSViHhRGH19T7x8DH5EE9yBXD8ixNRxsfV5hH+8N3Vh+PT6SxAl
         DVJc9huPgl6SYAUBuEPg5CuY5mBkCMhnZB30KrwLmKBU/yQMP+eEgLPE5j4jv+lh3stE
         Ea98WIKziODZDVOcKaPdmNHPpD2RRcZUNBPz8lj1DLkG+lT3hjHvb6CgTWhgmv6fkta+
         cgnOlm2sva/94cIVPYiRMOki3FmvPPCL2d1sEXCv5XSY+QR+qtIdZI+3fVvOP1A2a2kR
         cMrFXGNQTmEJ+zwlQ9kj3o/yJ14tE25fqXSoS7y9d28fGte1DDc5fAwDBzculSRGOoeD
         oYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1rcFnGwOBJPc4tgjdRKJpXz40Fnn5DOONKlluyZPLO0=;
        fh=pfZeNqhZy+CwbpHYZezQDrdsCh8L5Ia2LIlRcmDufI8=;
        b=fUS3JyFQVK+GKuVlhN+XCFfY5z1Isj9SgbsktUj83J4Kj51SoPzCxPD3+i9mumJuUP
         PbE8SeKseAB82Th2USfRy+y3HD0Lq4YBEqtwStMdP29LamNBJFKmE3zguGhHvFSqf838
         WGupEzC8gIkYCw+o1oMm5cYGbHdPlPmxrqcENG0Ik0X7TPsTxBN3sVpjCbY9v5mRffBx
         MknKDrbgunsarGhKXEfx3CrwCVcNrvg9e+cm/jrcTGnEqWMpVRkyhYA7lOaJhnul0eSr
         bK0N+IjwiDbuA/g7az7m8KAQwkENsu8SKC5z/LElcunJrDWsujrXkXuh/Ce13v2zSV8q
         uSlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791030611; x=1791635411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1rcFnGwOBJPc4tgjdRKJpXz40Fnn5DOONKlluyZPLO0=;
        b=ICHEts7rQtQJy0wzKvoy63vJRuKHGMZvxA/1+773lv+Wje2qAIntzJZowMRvWK9bD9
         xc91ACmBEAjYCsj9MmZ9WSpnNEFjjWLSDfvt1A65R0pA3lyHHuU4XzfN5/Gmal03VR3b
         zlDfz4c962Tbtd5jBkf1FfEdDnaJ9H/4zqRQ3HMPEo8bFqy1V8FKtJ5NQcZ+tM8iVmkJ
         wjLD/TX931ywKtCMvWUHlMgxEdnJBRZb6hxNiKlVcgf4tryFaZrhUnqY7ypZK+IUsAe+
         R20AFD46mJ97RndCDGviPtkAtXExMoHG+V2pPvneZP2gAJtbQHZA8TXlhg1tiKEyiZPB
         yu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791030611; x=1791635411;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rcFnGwOBJPc4tgjdRKJpXz40Fnn5DOONKlluyZPLO0=;
        b=HYmTLhR6eD3Ot6jeisSoj1ht7pd7+YA8iU9WyuPptq+CUjwTyKpDUUfeis8E2ePeC6
         yz1fceqIT6/V8eiQ90l5xdm3rG2wQw+T///i7uZkcyWHRDaaHFZwOV9tvd1wrijNrKMH
         Ahn48KTgUwN4CRnQJgscC14t8zcDdc17fNZB8V9YyZQiFCnVZGqnNjYrfymvNqMeVAgS
         ZHJie5gBzwc8bmm5FfBCHFIR1YPvBIX+vrH+uCY5+jwW891scq6bIiyqrE5e0KZo7zuy
         67b1y6abMku08fxtBuS2mnUQhZ6lCiQ68VGWCHz87PZcb2GLDwVqvBQFyZm6h/7lcPtY
         YyDA==
X-Forwarded-Encrypted: i=1; AKwUvBxi5LjpGlwrIYFvQnI7JifL/uDqB2twNxN1n1m4GUzkCI60eVGIZB0S93KtZPYDBfH9hR6VwNvvJSnfI/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAvehcgvbzN3nT1VVgR2CZITrbDOoEvi1UMZXjWCZyuuVNVO20
	EuAOM1v5sP10ONhMw/yxvwhfy2uQwWTMd7ewWkVJTC4DS458p5NGmyTNzcj/KCB27J6/a+70RO2
	QQ/DOhqKfuZrD7OgTXDFOTO0FXV5Z6/8=
X-Gm-Gg: AYBFou2z+qdiIZ58Tuk5fXztlYCAS1Errlop5QDh3S5eIM8tbBhQemCubgeJjfwgwmt
	tvRqtbyEWEHzob3m8lRFPTiFV+52Kkev49flfHAbqDNfpL7soF/ghsTsLqc3uSZkZuPNjzZgN0a
	NEgLAfrtb21QXA3bjT2i2qak4rxG+kzcxrdu6NE48JXLTFWDF8Bg4Ask25YgD26rtdtKM8HtTZV
	UuLVmHwXnB8vGUQt4iQK6qFzu3m9eT4fxEiDjDr0MRj8aPQx7w14nfk3uAtO8VEWEIbclBJgYkJ
	w+OIZP+PMFQlqiooZVeuBTFUIf5EA+Br+S/k17QwEi/kRnRrkVlrVeH1EPSNOb9eGP9TQObDdL9
	/VPzzVu5Kk1HQhW1aAdsoriQ09uJa24txBK5dreihEXXi6UhC7CqxeO988XkO0PihZEuihQLRtp
	LS5xEgHdR4AzpCIm/pBwdNoqUiRbdz89C3EG55dJD/1zgVuRYaszE=
X-Received: by 2002:a05:693c:6090:b0:351:18d3:dc3c with SMTP id
 5a478bee46e88-35118d3dd9fmr2927720eec.0.1791030610865; Sat, 03 Oct 2026
 05:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617-rust-kbuild-replace-procmacro-extension-v2-1-667bdc3a6435@fritz.com>
In-Reply-To: <20260617-rust-kbuild-replace-procmacro-extension-v2-1-667bdc3a6435@fritz.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 Oct 2026 14:29:56 +0200
X-Gm-Features: AclHuK8rsCn6lZolOMeCDhA0TDOEZE4YAnfFpck0egreN2YiZjMkFmzEgwJYFZY
Message-ID: <CANiq72mqUDt23jBFr1YVf_5WdO8xcdX0cXpAA9wiawy-sdfcPg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: Replace and dissolve procmacro-extension variable
To: Nicolas Schier <n.schier@fritz.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 4:10=E2=80=AFPM Nicolas Schier <n.schier@fritz.com>=
 wrote:
>
> Use make's $(basename) function [1] and substitution reference [2]
> instead of $(patsubst) to extract crate names for rust procmacro
> targets.  As there is only one user of the procmacro-extension variable,
> do the crate name extraction in-place and remove procmacro-extension.
>
> The procmacro-extension variable is used to record the binary file
> suffix of dynamically loadable rust libraries -- which is 'so' on Linux
> and others and 'dylib' in MacOS -- to remove that very suffix from a
> target file name for reconstructing the corresponding crate name in
> cmd_rustc_procmacro.  Extracting the crate name from the target name
> in-place is shorter and reduces complexity.
>
> Link: https://www.gnu.org/software/make/manual/html_node/File-Name-Functi=
ons.html # [1]
> Link: https://www.gnu.org/software/make/manual/html_node/Substitution-Ref=
s.html # [2]
> Reviewed-by: Tamir Duberstein <tamird@kernel.org>
> Tested-by: Tamir Duberstein <tamird@kernel.org>
> Signed-off-by: Nicolas Schier <n.schier@fritz.com>

Applied to `rust-next` -- thanks everyone!

    [ Rebased. - Miguel ]

Cheers,
Miguel
