Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A06F2EEE90
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790036582; cv=pass; b=Zc+YjJKUjkvlVVptN2Jcn5uw3bQ4CgOJDZmG8n2iMAwhw4Mt+9ju0IJg0rhwojX98NFdi/rilRO47wN0x9kmTlbjpl2eykBW4IOcwEqbF2idBQZA2cLrEtuncGGI2BuT4T8utls1jFWplImga0w3iIpW2B0xopMezmkWd+PRWJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790036582; c=relaxed/simple;
	bh=BShgQSnRDZvpdNI6IHTdW+TRccJX3xOCsX6/sLv8Q2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cao5pasOqrCVfbDEfDuCaPGLypkDNoDc2bVgGTCVOyuv8uE/S+o65C0nPf4sTQjXGo4TShC2nw1VeL+8u6jwUgGoyzWMGGVm55yMXRSPa9RHH2lhlK0w0rW8XiFpF0TmR71PyXsMr91VV05Oe73iLJub4N5dtXyOOTuy02P3bx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KtNcEtqy; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KtNcEtqy"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530fa0716f6so41582451cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:23:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790036579; cv=none;
        d=google.com; s=arc-20260327;
        b=VFaHXsLSKzUcS2z5dLBqJNfF7NEyw5kL8pJsgtHmXBbi+lZNNTki5xh2xpuIkvP66I
         c7ttHGT10ZsbpRAXwqetzD+5zjPCqB83sRrhf/OKHrYt2TjNi7d1K/PyJZ9tNw4OWXkp
         9fT+k8WCz7663AFbg3RIQ0rEg/y/Ngx0uRitxiIsrgsACoGgFpvMru+M5dtdPWPt/uo6
         huRB+T0ZvVltIywYwWUC6EGhd/iRTP+etPCrKHRbMDYK6JSlr/UcN1So3ghuqg/V2UpL
         BmR2I7iJ2MZ6v9zAAXIJqyZ13YWxu5m33nP6J2WBfctzlNOR8WP6g3xH3mRPHxFwrrXP
         kwGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jQN61CI3XpI1eI/D+U8aClQsfi0fYX2Xsqv28eim8Zc=;
        fh=a+wraei2z8EVvhCKXJWenHQ5r/1trN34+T34970R+Y0=;
        b=lppnzoKZz2kR91Gdur+N43rqHCIA/zbXaOge0/2IDKJ3i+MlJ9WSsvPKP0arH5J8PY
         cwXwKykH/pwAm5lGwF0oOIfSREDUS5PnNGQxp7vGMhRwYgETlvP39JjWZOVA+gonBp5u
         173kiLjcAtq27Sv3xP6P5Yf9VZVEQPtas5MpPIF4Hz41L0dYe68LSpuOkdig6zsKANP2
         BB02xh0vVz+wkFneO5GPG3GNCLTE3W31eUnDMqmMVx8wFDOVa/pbC9FhbEMcTYXExdTG
         tDY+Xpv08glS5u8/4Demb3Wr0utEx49FQcau6kj6lJVB7f72pys+6CsXgVdaVpxBwlPX
         bqSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790036579; x=1790641379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jQN61CI3XpI1eI/D+U8aClQsfi0fYX2Xsqv28eim8Zc=;
        b=KtNcEtqycm0Va/NFZPwU7wbAc/DEpZP8h3h4AeQLWYk4rqVRTsEuk74K3Mb4uiV2AS
         Z5RGUd+98dix+C5Ndc7NhmckQEKF3zW6/tzlRH1mG7X+8i4UGsOdnVKvrghyjx/YV1gz
         vJ+T3056EkdcswEsV43DG8ZiANpTVtjpnhndFXSAVgtyNn/41UN/u5dkJJuxoOT/RgsC
         iFW6oQuJIYTMXvQqlJvZSUr0TCtEr5XdpRR9K41g+SdCJhQ2X5zDKwGRS7wnFaqgiK4O
         wkYH+H4gnsjhhzZFiygxIlhuXJffOLN02hT/UcWhpU4KuhvRLNxGGOf5Fdd6Zh+Z2si0
         C8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790036579; x=1790641379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQN61CI3XpI1eI/D+U8aClQsfi0fYX2Xsqv28eim8Zc=;
        b=morW9JbhdonmCDX2ucDurq+f3SecCLwsh53NIrEpJ0PP0fY8sc9dxqvF4K/fyiqap+
         KMsG2GJqK1zJ6BhOge3PZguFCh9mnJ1cdsS20OISdOmZJkVCuk+w4GJ0aZ4nFzMrv/+F
         blFkKZNcmH15yP0mElCKyHGftWwbV4lcRbV0aiOTNqI7Z5XK90yBmhHiB3NS8RTSQuvp
         Lf8/NyC+BZwVSW7YOSRBvkhCc2+EqLVVHM56ePCt2a6iz7yrddsJS8lbevTw32ZuGk6g
         Gn+Eu7h2rXEAP7buTMF80pMWp+RgYEvzGdRFAp5Zdv47IxjmYpQICiCaMCqEBf1q6PvA
         7ZEw==
X-Forwarded-Encrypted: i=1; AKwUvBzU2lLObPfgtw26B0OjAPRDwN45CDDoD3KvShWFZcuk9dELFqgmHp9t1SdBpJBy3P08YuoW1qt3VXuoMY4=@vger.kernel.org
X-Gm-Message-State: AFuF++kwupIomuNhna93+/x/ueC2yDkeNSCtUi8NjrdujL1TSXtec8tP
	DC3zLjfFaHWd9AXYhgOihubV7DkwVXDFxVX56IbSmqFVO1zz48xwXggG5RHkjCxIQU3b6g7CzYG
	5ncCNV+6b94XsfS++4sx42W6hTNunSS9WAQOzygvd
X-Gm-Gg: AYBFou2D8hNNn7yNmbPKLxg0+513HRcso/z4H7dALnliGb2RLkTCmqWF4bDAU1d5JF2
	9+4lhv/tzLeQZ1+6WMx9yjiwoPh2CjM3J93FM/H4qi9ZifEbs4PkZP5ftclorOV0gQkdbshWWmy
	gG5V1j9o8WjTZRtKZSEorj42/XuqkjYE7aeXcSIJx1Ug8jEwoV0GOemiyLB9eVS/IaNpcOcIBct
	DnTJDa7MHI6vNchYjGjlA3/PDxEoAU6+bBHk3NISKUKDysN6x0hJcDNfGhy6AxVN0WMph36dNW0
	FMDhAbkGu0OOA2gGKhW/oDAW9NEu4vSPZQ2LQKMumOufW9G10JB1bczVQPZRtTa1WK2Z/gUdoLB
	gAT9mxm4x6HCQOsms7dYImbBreG9z7dTdst2y2F/mfvO8HnXlvKR7QU9Zk+g2WqzyIBHQUyfD9n
	0NJY9W
X-Received: by 2002:a05:622a:4d1:b0:52f:b9ad:9dad with SMTP id
 d75a77b69052e-532d8e379c4mr30898621cf.36.1790036578472; Mon, 21 Sep 2026
 17:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921222609.50824-4-jeffjo@openai.com> <20260921222609.50824-5-jeffjo@openai.com>
In-Reply-To: <20260921222609.50824-5-jeffjo@openai.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 22 Sep 2026 02:22:47 +0200
X-Gm-Features: AcwNN1U8yZYsoXQmu5K6WdHeMLLadZtQsvSs1XAbGHZMJT-3PJKd4bwNzD67oNk
Message-ID: <CANn89iL6dWUza+iZeUwtB8b9V0=c6T3jPr9gOrJ37CJppiQB2w@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: refresh TS.Recent for accepted old ACKs
To: Jeff Jo <jeffjo@openai.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 12:26=E2=80=AFAM Jeff Jo <jeffjo@openai.com> wrote:
>
> A TCP packet can carry new data while acknowledging traffic in the
> opposite direction. With overlapping traffic in both directions, a
> delayed packet's acknowledgment can be older than one Linux has already
> accepted, even when that packet fills a gap in the received data.
>
> Linux accepts the data, but tcp_ack() takes the old_ack path and skips
> updating TS.Recent, the timestamp saved for outgoing acknowledgments.
> The reply therefore echoes an older timestamp. If the sender uses this
> echo to measure round-trip time after a long idle period, its estimate
> includes the idle time and can reduce its sending rate.
>
> Update TS.Recent in old_ack using tcp_replace_ts_recent(), before SACK
> processing can trigger a transmission. This reuses the existing timestamp
> and sequence checks, including PAWS protection against old duplicate
> packets. Leave SYN_RECV unchanged because its caller rejects old ACKs;
> established and closing connections accept them.
>
> Echoing the timestamp of the packet that fills the receive gap follows
> RFC 7323 section 4.3. In a socket reproduction with 300 seconds idle,
> controlled reordering and retransmission to exercise timestamp-based RTT
> sampling, the sender's smoothed round-trip time was 37.5 seconds without
> the fix and 15.5 ms with it.
>
> Fixes: 12fb3dd9dc3c ("tcp: call tcp_replace_ts_recent() from tcp_ack()")
> Assisted-by: LLM sparse
> Signed-off-by: Jeff Jo <jeffjo@openai.com>
> ---
>  net/ipv4/tcp_input.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 92bc60716f33..f3f4c905ce00 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -4465,6 +4465,13 @@ static int tcp_ack(struct sock *sk, const struct s=
k_buff *skb, int flag)
>         return 1;
>
>  old_ack:
> +       /* Closing connections also accept old ACKs. SYN_RECV rejects the=
m in
> +        * the caller, so leave its timestamp unchanged. Update before SA=
CK
> +        * processing can trigger a retransmission.
> +        */
> +       if (sk->sk_state !=3D TCP_SYN_RECV && (flag & FLAG_UPDATE_TS_RECE=
NT))
> +               flag |=3D tcp_replace_ts_recent(tp, TCP_SKB_CB(skb)->seq)=
;
> +

I think you missed 3d501dd326fb ("tcp: do not accept ACK of bytes we
never sent")

sk->sk_state can not be TCP_SYN_RECV at this point.

Therefore your patch could simply be:

if (flag & FLAG_UPDATE_TS_RECENT)
        tcp_replace_ts_recent(tp, TCP_SKB_CB(skb)->seq);

Thanks.

pw-bot: cr
