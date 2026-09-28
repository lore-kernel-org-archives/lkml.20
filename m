Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B7B36D51F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615843; cv=pass; b=uYSIhbCD8NJUL+hjqtqUljsezmLCTu4yihzNqiexap3pen9IrPS9TTCgkJsyP7CppUIKZBGF93SgQ+KsDIP3JncVzhbhQP2cndE8t6xuaSsZiq0USl0nuas1dGVH0gL3dEauZrpZkic7SfEomNfS54uu03kwqeQuvryl6Fc87HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615843; c=relaxed/simple;
	bh=UyqntIiPxC/vJFVio3C1PXsVCPlN47xjv622T7oLz7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1zrTYpoBiJwenvXHfv9fRzFz5ggzkV5uD+ssF30v3MfwKOHsVMLqdUT04Ozru9O3rpxBY2btRyjUPGEWLmijkEPx6mIYoHIuiz6R6ndrnYUX4wEOYkuxY1SSMkKY68uwyadsxLdXDshv1c2HiV9aIhMLksZXEYSEr8fq7nlQBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zdlq+bpe; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zdlq+bpe"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d6ff23d81eso2777845ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790615841; cv=none;
        d=google.com; s=arc-20260327;
        b=cOb1if/puXWLRs/567zwOHVn0EYNvwllfAYnm7e+PeCQ9z/02H9b9EUSicLJPtniRo
         E7hGa8/hZ/rMNT7t50HLNpSCtRafypn7OaseHxQ3wTkvWwJ0Jx6l93G0YaIEf9/Nk2ho
         7IuHT16s3MbMOeEqxbyhPHoQPbinmxIqnID3AFc8+kG2GkWxNe551A8soRxLCZ9CgPwa
         ufM/O0YTQrUx0gWP4yxtG1DE/MDV80H/W1Bg0bWniey1+Qel45m+ar601WJeyB/kVXip
         3jRUS9K/MGAASZUQYUVjQ8PkCHoKbztC90TdZJrtKy6ryWc3qunKImoIxf8aXUnLUBJ0
         X9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UyqntIiPxC/vJFVio3C1PXsVCPlN47xjv622T7oLz7k=;
        fh=yCE+LA1/gbupCsuBPCNxbCaviANf09aGEDsKRWGH99A=;
        b=JDNI2eIr7nurOEEKMu2hwwtV7scXCRhxZVKL7MjCY19U8A8qM9L2iGj6OiALpj8uDw
         4alvLpTp90oNy1wg/2qmRObR1o3wjiu0B/FfB2klFMFNqIynqLQLrf+AwdCWPLIiwbRu
         NWJ+eMckKbtWSruNRzYnvbLrzV31B0Q+cuH8DEVGDYgOPcn+0C4DS8THGpg6SECTGnN8
         yX9NReqqlydelZ7uyM6k3wM+NSXsddCeitzxtW3tDxnV/J2F4cEuHzYc+auuNgCm3+qj
         7ZjLYX2NLhLX+fiQt/7oyDN++6iHgemKFQ+uZujdLoh3ufsz/ptOpYc54d8XSiaePtjb
         YjIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790615841; x=1791220641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UyqntIiPxC/vJFVio3C1PXsVCPlN47xjv622T7oLz7k=;
        b=Zdlq+bpeL+kRHts1FA6LBO9vO6RxDaEwHIGmOpHPWL3l2+EuzQwzRSocuwCHg4BfPJ
         MrRM3yq+HfPcaCIN+cbpWLMNKHFB5ZoFwoCLuc08/xk7Nx8oiIL2E80964/A8hzTMczz
         +O+HpCjbB17ecFv+VEx5gu3QznWMkJvC7dw/b/54qseP7BKXxrTN4WjQjIgP6KQV/ugK
         0inB95S5ds9ga3Zifkz6V8JgT2i2gBoCIpPWfTIsJjtnVh3snE1we+84DssT1rz4y8AI
         dB6yNa6qOX1nEkTvfAxs9Q/G8lRTf3JKahUbN8WYreXFKOeQpcbypL3sPlVNXR0Jxm0X
         CeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615841; x=1791220641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyqntIiPxC/vJFVio3C1PXsVCPlN47xjv622T7oLz7k=;
        b=PSRlhaiRV7B3GNYTYUHkQBFbntbriw3G1VxVmQz2JftDIvI8WGX1PKVpnGycUA7050
         QiEN9fpeXEJSMLn8fSGhI/C9gimbfVbQ8+qeQr0M8k99xgXTeawPA9VvesIvG6ucDybj
         iJnYxjCRHPHRFz6A4FiKHy8Pc4uCgjmiaDitiSkXdeCdnD3kTC8mgR0Y2Lqv9DwDe2bo
         i6LscqQKLVsSqcoKuRetWEZdF1jA6P+hyASSMcevIM+fwCtLdhpUdKZTG8ObveaEXpfP
         5pqpZGxJPHZemm45YKBPyfyxaFLIQ+vi4mF0L0J//8hK3dBJvXCtvSXz0rtCFbjd4jAB
         a2Pg==
X-Forwarded-Encrypted: i=1; AKwUvBw+GOvhNbg6bMf7zudCTVwmhm/pij9Ptoo0JYMcSv4AZVGMuALaMpZTC3GyheRAtYsRlbGQXVkF7BDV/os=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/T5GoJk3eRDz8x7O1hLR6fZCcHvTFaiywJ3KsKc5tAjJ8uhft
	g1ppR5pGFaqJv0SHPoD3t8AIvRiiiSWxcuAziyjqV8X1CzArQuU9VBCTblV0Eu2OeDe/nESc9ud
	d08sTpXL4yYUWRiDnLmDce9NpIjKvHQU=
X-Gm-Gg: AYBFou1dSRUHweZ899/eMgWcdBlyCiQSiN/IvV6V6+/OrlZsm+iPFJ1CjbOYF+WA0dm
	QEcekYNknmxLk+E9b6ndtP0zPdjPnoLTm0OpZsym1P4gZJx70aHZs2mZhkjLaDysbwf1/dGJC2i
	BCBamEOe76avmBNEmhRsSrWwoBJ21uD2gcaJnAusHPW/w73cUjJS1LXuwtAE5BSf24FzRq1Y60G
	tzlnAzedYjpbqsyTiVSLHh5ZSyp6INeLn4gs+PivHl7UGQ8NYtj2HkA8+TdIObxJrBVMOS9tLhE
	DVixKWmDq7IhNPfvi/kKz6VUP4reWT4yGOb/xHuFjHDylbQj20xYLe1XFaKyS9NEW3UKHV2JvGS
	GUuLsAKPnMVYMOI3OUxOLSnSQz00UBIiHquhiAIkw/+S/GQmloGFBNiYlxQ1tv4R9lmWkh3Wi+b
	MCc8kwuvcHaXZLVF9BHPTMuNRCJMYjgMcC0vrD9yJOZgMgo4VS7WQ=
X-Received: by 2002:a17:903:32cc:b0:2d8:f4d4:7044 with SMTP id
 d9443c01a7336-2df7deaa2femr181005175ad.3.1790615840841; Mon, 28 Sep 2026
 10:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829161013.102967-1-mehmet.mkoseoglu@gmail.com> <20260928162214.487564-1-xuyiwen14@gmail.com>
In-Reply-To: <20260928162214.487564-1-xuyiwen14@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 28 Sep 2026 19:17:08 +0200
X-Gm-Features: AclHuK9Oi3HYdpfBssBZXi59FnPj8n8w5d4DbZjLEM1vQmIq2zJQWHOZwy-yEls
Message-ID: <CANiq72ki8M1KmxhO4vSkMUfLcuqOMvZtuTNdDpS-UcJy8rqWpA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: cpufreq: reject NULL from cpufreq_cpu_get()
To: spidermana <xuyiwen14@gmail.com>
Cc: mehmet.mkoseoglu@gmail.com, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, lossin@kernel.org, 
	ojeda@kernel.org, rafael@kernel.org, rust-for-linux@vger.kernel.org, 
	tamird@kernel.org, tmgross@umich.edu, viresh.kumar@linaro.org, 
	work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 6:22=E2=80=AFPM spidermana <xuyiwen14@gmail.com> wr=
ote:
>
> Either way, looks good to me.
> FWIW, I hit this too and have a reproducer [1].
> [1] https://github.com/Rust-for-Linux/linux/issues/1258
>
> Reviewed-by: Elowen Xu <malanalyzing@gmail.com>

Thanks for taking the time to send the tag! :)

The From: doesn't seem to match the email of the tag, is that intended?

Cheers,
Miguel
