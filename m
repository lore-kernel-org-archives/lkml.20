Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAF14E8E16
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412749; cv=pass; b=FYJfaYoJriqCwmOR6aIn9jCkRmLzJkSzjBv1mtruCJw4C2XCyqfxVyLvYTz/xNaFDDvUjLQeDvEsnRpyLZfGMzc5sUocnTw38iJc70Z1jylNB23fxIziTn4RUs6WJJTLdURBGwBVJYGdauBIKFs9jFPWgfuBSEfs9dBWjd7xvSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412749; c=relaxed/simple;
	bh=izRbEgIyPWWKRcko0zVkagJHIxL5p1T5W1BrUUvaYlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PO5uAgKYtWPYcM0K6nx2NjY+uWjsI2v8/BojhhByBCUn6rK/Ei/QLdIKftK9pkkeU29Xc6Stq2A4hUORVg0TXT8NII55CuNN59Jx/UPHuTzjVQYM7GYiP1W3VEYcHTS61XmsIfjVo7xk/4De8HWgGBXEmGC2HSBzK2tGd/5M8fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DopmaYFM; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DopmaYFM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1667403f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792412741; cv=none;
        d=google.com; s=arc-20260327;
        b=hLyfldr93vkTbW2yi0cUoIrkRipWiqLcNb299yFXzJYRJ5xOeVdxdmwMImhArpu/jA
         IZOpxVFmVvhpCzO2EVCT0E4bwm0aVJsXBZeSqzjiweJUDoo0YguVs11zD4yt/We8YT2X
         7lpEgiWCnQvWFEcVAECaMXI8ei0SSUYjGZZBlj2gtArkVN+fUWsnS14BnsPcjy3mAzPW
         XApXSAcew7hr0mqJj+Vp8rFVFSZjAvciaZtXbGY5vM4uNiyr6M4MVB23uzV4TLSqdS8B
         67I8YSGzpLJi6cocceugog1nguwBTgOz6P0C6HhqjMkKhx4X1376czTcQGkvW7F9xIHe
         9Zug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=izRbEgIyPWWKRcko0zVkagJHIxL5p1T5W1BrUUvaYlY=;
        fh=VpsRlMbNT4o0+KEVGlirARM0aoj1T095+UTNc7X/5lg=;
        b=fYtckFInWCV0FU3GzwyzZUo2kHJ6BBzXxfEF9YUlRrv39Iha5iuRIXU+xP5vLKNjDn
         gYbbvFBR/uHZQAhG5y7qvYqxTANFNSd1ww0pYailR72S3ecm/sRlaRIfe4+1Qa/kF/ME
         vfxHg0XQRgZlpcHLr3DwMBNRE5eroOup72pUkGci1x6MEhED8zBMCg/LP89U8KM4kyDX
         EIqPnteUZGucLqLGIzkTsBeZ4aoLMSLoF1cPtbXUU2j90JjHMAN0LQmbfg438tDxYQZ4
         3v0OGaFhpaClEh4hwPvNEta89Q6aWaZ1MTkcF4FfMdabGY2AKNn9o8Q5Djcv4bKP2xBu
         bMWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792412741; x=1793017541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=izRbEgIyPWWKRcko0zVkagJHIxL5p1T5W1BrUUvaYlY=;
        b=DopmaYFMd5ce2bvtaJi9Dlbo0PwRzksmWZKlm+WryJH7VlF4CyyW/aYa33hu2heW2J
         ccjO9pFIDojHoOcJVwJuY80QdPnC15n6zZIPkFghCv81QYmtUprVYFb7DApk38TUroJW
         3Rm1HBm1RF51IArHmn90ZhtLVVlAVUS8GfCd4XJJ16q0n1T0zK9S4n7ArGIpqhRJM1vJ
         p860YJb3Pa1UNz/jpKn6SmRaxpBU/2RRkv4iuAOX0fODqIGvnvATH7unVKV4zAYqrHQC
         NkbhM36ZZMl65x6rIxEeSuB4tlfRh9BUp9bJ3YDhn6wzxA3OSjwudHWT6e8aZkpuYwCJ
         n4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412741; x=1793017541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izRbEgIyPWWKRcko0zVkagJHIxL5p1T5W1BrUUvaYlY=;
        b=Dk9rOf5HDgE2GD9+pIwRRNbKGk/d33OJ0fTT3KhgOHVVg6phn76CJJRUjOo+P+tpdd
         KYeIaqasWGoWhEfgFcIfm380aSxftHEo97xCTvkNU7owdENp6j4MNTwkw6ya1jWXSOFW
         m/JZHpDux4WarRitYHrcjGZkaT3Izrjb4LZOUm/1bl7R0N/Xl8tPDrDyLjCjHG3lExhz
         yWoq6QS4Gjl8KImZ3EQSXIcSSc+uijBEcjbhH3XOpeqZmGMw9IYzT+yiLlCjz5uWEuMy
         Tvn+hRoVGJXpF/oMei6BsS54Ez4+lxjisJ1BY/7dC6YDs2tTTaiguUqYR8RDQJrpnw+a
         deDg==
X-Forwarded-Encrypted: i=1; AKwUvBxKY4DaquyYHmNF5iRuLBeIeThJoqg6wKiCDjdsKQsc1vI7wsjbbEp2DbXuuS/zYpAJJbCu7CC9SwFI3/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrCyeVY8I02I3SldVbvokz+b6kzOf8fkV7bBmGaQCrNPqUmXlc
	DeVoDFz5ZzSoZIE+9D5FkhMQ3dZwDYZ9NqLsPf6LLJZY/pK0CH0Ye+7DonELnH0/c/nRasJxZEO
	1bGpWmOztPOQHGnynrBRwpO7O9IT2E5wATT6T0AU=
X-Gm-Gg: AYBFou0iIvbc0kBIGOyX/whOwZdzTsdU9nVmQUj3sBmFTvq86GecZBP4TBXPIfBoP77
	5KrPiA0y+bz0P8mlLAtDSdI/tdXoOTLvB3MaWHi1Gg5PZKshqNdddIy3oeRb387xlcB5hsmDiBg
	hHC/Dw4Ku2GpxIt+iFb8jHmKeBpmetF+TpfM+eWJ+jTX+raVALmWBff0mkttcC0WFWKPsCrWOnT
	/WQU8tc6UVZ6RAIVvfrRrh52moWMuLh5tGndcd87NVA5yFDP+bOw1yeaUZ5wvJ9rNxfikKQb4fx
	NHrrr1FUCRG3FNmGyMPgJbOy6HndMf9Ql09l4/MiuMPCi/bikPhFz4k=
X-Received: by 2002:a05:6000:4006:b0:48e:314:f9f2 with SMTP id
 ffacd0b85a97d-48e0797597bmr14581593f8f.8.1792412740313; Mon, 19 Oct 2026
 05:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919130925.1899994-1-kaixuanli0131@gmail.com> <9efd2ca3-ae57-428c-97c7-bc2300ba9a42@kernel.org>
In-Reply-To: <9efd2ca3-ae57-428c-97c7-bc2300ba9a42@kernel.org>
From: Kaixuan Li <kaixuanli0131@gmail.com>
Date: Mon, 19 Oct 2026 20:25:29 +0800
X-Gm-Features: AclHuK-9jqQcebO3EVLU5aDDPix8kSEJVlaRit2v8EyHo0TC60WVCoivxD53614
Message-ID: <CAGVefVXTsrxW7BeGvvg2-VUUsP57LSmamZJxffKdrg--_yPfyQ@mail.gmail.com>
Subject: Re: [PATCH] f2fs: bound the SIT/NAT bitmaps by the checkpoint pack
To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 10/14/26 14:14, Chao Yu wrote:
> It looks the overflow issue exists since the beginning, w/o c77ec61ca0a4,
> {sit,nat}_ver_bitmap_bytesize was not checked at all, c77ec61ca0a4 just
> added partial check, so how about:
>
> Fixes: 39a53e0ce0df ("f2fs: add superblock and major in-memory structure"=
)
> Cc: stable@kernel.org

Agreed, nothing bounded them against the allocation before c77ec61ca0a4
either. I'll send v2 with the Fixes tag changed, Cc stable, and your
Reviewed-by. Thanks for the review.

Kaixuan


On Wed, Oct 14, 2026 at 2:14=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> On 9/19/26 21:09, Kaixuan Li wrote:
> > sit_ver_bitmap_bytesize and nat_ver_bitmap_bytesize are used as memcpy
> > lengths into and out of sbi->ckpt, which is sized from cp_payload alone=
,
> > and nothing compares either length against that allocation.
> >
> > sanity_check_ckpt() has checked these two fields since c77ec61ca0a4, wh=
ich
> > added them after a crafted image overran build_sit_info(). That check t=
ies
> > each length to a segment count; it never compares either against the
> > allocation, which is the half this adds.
> >
> > Mounting over-reads in build_sit_info() and build_node_manager(), and t=
he
> > first checkpoint writes the same lengths back through the same pointers=
,
> > so the over-read's contents reach the on-disk checkpoint. An unmount is
> > enough; the filesystem does not have to be used.
> >
> > Bound both ends the way __bitmap_ptr() lays them out. The three branche=
s
> > differ, so a single sum of the two lengths would still admit a small
> > overflow when cp_payload is non-zero.
> >
> > Fixes: c77ec61ca0a4 ("f2fs: fix to do sanity check with {sit,nat}_ver_b=
itmap_bytesize")
>
> It looks the overflow issue exists since the beginning, w/o c77ec61ca0a4,
> {sit,nat}_ver_bitmap_bytesize was not checked at all, c77ec61ca0a4 just
> added partial check, so how about:
>
> Fixes: 39a53e0ce0df ("f2fs: add superblock and major in-memory structure"=
)
> Cc: stable@kernel.org
>
> > Signed-off-by: Kaixuan Li <kaixuanli0131@gmail.com>
> Otherwise, it looks good to me.
>
> Reviewed-by: Chao Yu <chao@kernel.org>
>
>
